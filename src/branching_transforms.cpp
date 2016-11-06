// Copyright Hugh Perkins 2016

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "branching_transforms.h"

#include "handle_branching.h"

#include <vector>
#include <iostream>

using namespace std;
using namespace cocl::flowcontrol;

namespace cocl {

template<typename T>
void vectorErase(vector<T> &targetvector, T &element) {
    int i = 0;
    bool found = false;
    for(auto it=targetvector.begin(); it != targetvector.end(); it++) {
        const T &thiselement = *it;
        if(thiselement == element) {
            found = true;
            break;
        }
        i++;
    }
    if(found) {
        targetvector.erase(targetvector.begin() + i);
        return;
    }
    throw runtime_error("couldnt find element to erease");
}

void migrateIncoming(Block *oldChild, Block *newChild) {
    for(auto it=oldChild->incoming.begin(); it != oldChild->incoming.end(); it++) {
        Block *incoming = *it;
        newChild->incoming.push_back(incoming);
        incoming->replaceChildOrSuccessor(oldChild, newChild);
    }
    oldChild->incoming.clear();
}

// void swapParentInChildren(Block *oldParent, Block *newParent) {
//     if(oldParent->numSuccessors() != 1) {
//         throw runtime_error("not yet implemented: more than one child");
//     }
//     Block *successor = oldParent->getSuccessor(0);
//     successor->replaceIncoming(oldParent, newParent);
// }

void extendSequenceBegin(Block *first, Sequence *sequence) {
    throw runtime_error("not implemented");
}

void extendSequenceEnd(Sequence *sequence, Block *second) {
    cout << "extend sequence end" << endl;
    cout << "sequence " << sequence->id << endl;
    cout << "next " << second->id << endl;
    sequence->children.push_back(second);
    second->incoming.clear();
    if(second->numSuccessors() == 1) {
        Block *secondSuccessor = second->getSuccessor(0);
        secondSuccessor->replaceIncoming(second, sequence);
        sequence->next = secondSuccessor;
        second->replaceSuccessor(secondSuccessor, 0);
    }
}

void mergeSequences(Sequence *first, Sequence *second) {
    // put everything from second into first, then destroy second
    cout << "merging sequences " << first->id << " " << second->id << endl;
    for(auto it = second->children.begin(); it != second->children.end(); it++) {
        Block *child = *it;
        first->children.push_back(child);
        child->replaceIncoming(second, first);
    }
    first->next = 0;
    if(second->next != 0) {
        Block *secondSuccessor = second->next;
        first->next = second->next;
        secondSuccessor->replaceIncoming(second, first);
    }
    eraseBlock(second);
}

bool mergeSequences(Block *root) {
    // basically we look for any block with one single incoming, and that incoming is a basicblockblock

    // revised version: we look for a block, with gotoFree true, and it successor is gotoFree
    bool didAMerge = true;
    int numChanges = 0;
    while(didAMerge) {
        didAMerge = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *first = it->get();
            if(first->numSuccessors() != 1) {
                continue;
            }
            if(!first->gotoFree) {
                continue;
            }
            Block *second = first->getSuccessor(0);
            if(!second->gotoFree) {
                continue;
            }
            if(second->incoming.size() != 1) {
                continue;
            }
            if(second->numSuccessors() > 1) {
                continue;
            }

            // check if one is a sequence.  If so, extend it
            if(Sequence *sequence = dynamic_cast<Sequence *>(first)) {
                if(Sequence *secondSequence = dynamic_cast<Sequence *>(second)) {
                    mergeSequences(sequence, secondSequence);
                    return true;
                }
                extendSequenceEnd(sequence, second);
                return true;
            }
            if(Sequence *sequence = dynamic_cast<Sequence *>(second)) {
                extendSequenceBegin(first, sequence);
                return true;
            }

            cout << "merging ... " << first->id << ", " << second->id << endl;

            unique_ptr<Sequence> sequence(new Sequence());
            sequence->children.push_back(first);
            sequence->children.push_back(second);

            migrateIncoming(first, sequence.get());
            first->incoming.push_back(sequence.get());
            first->replaceSuccessor(second, 0);

            second->incoming.clear();
            second->incoming.push_back(sequence.get());

            if(second->isExit) {
                first->isExit = true;
                sequence->isExit = true;
            }

            if(second->numSuccessors() == 1) {
                Block *secondSuccessor = second->getSuccessor(0);
                secondSuccessor->replaceIncoming(second, sequence.get());
                sequence->next = secondSuccessor;
                second->replaceSuccessor(secondSuccessor, 0);
            }

            sequence->gotoFree = true;
            blocks.push_back(std::move(sequence));
            didAMerge = true;
            numChanges++;
            return true;
        }
    }
    return numChanges > 0;
}
bool huntTrueIfs(Block *block) {
    // an 'if' looks like (we're handling only the 'true' case ):
    // (something)
    // ConditionalBlock
    // true: BlockA => BlockB
    // false: BlockB (constraint: 1 successor exactly)
    int numChanges = 0;
    bool foundFor = true;
    while(foundFor) {
        foundFor = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(ConditionalBranch *cond = dynamic_cast<ConditionalBranch *>(block)) {
                Block *trueChild = cond->trueNext;
                Block *falseChild = cond->falseNext;
                if(trueChild->numSuccessors() != 1) {
                    continue;
                }
                if(trueChild->incoming.size() != 1) {
                    continue;
                }
                if(trueChild->getSuccessor(0) != falseChild) {
                    continue;
                }
                if(!trueChild->gotoFree) {
                    continue;
                }

                unique_ptr<If> ifBlock(new If());
                migrateIncoming(cond, ifBlock.get());
                ifBlock->condition = cond->condition;
                ifBlock->trueBlock = trueChild;
                ifBlock->falseBlock = 0;
                ifBlock->next = falseChild;
                cout << "creating trueif" << endl;
                cout << "condition " << cond->id << endl;
                cout << "trueblock " << trueChild->id << endl;
                cout << "falseblock " << falseChild->id << endl;

                trueChild->incoming.clear();
                trueChild->incoming.push_back(ifBlock.get());
                trueChild->replaceSuccessor(falseChild, 0);

                falseChild->replaceIncoming(trueChild, ifBlock.get());
                falseChild->removeIncoming(cond);

                eraseBlock(cond);
                ifBlock->gotoFree = true;
                blocks.push_back(std::move(ifBlock));
                foundFor = true;
                numChanges++;
                return true;
            }
        }
    }
    return numChanges > 0;
}
bool huntFalseIfs(Block *block) {
    // an 'if' looks like (we're handling only the 'false' case ):
    // (something)
    // ConditionalBlock
    // false: BlockA => BlockB
    // true: BlockB (constraint: 1 successor exactly)
    int numChanges = 0;
    bool foundFor = true;
    while(foundFor) {
        foundFor = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(ConditionalBranch *cond = dynamic_cast<ConditionalBranch *>(block)) {
                Block *falseChild = cond->trueNext;
                Block *trueChild = cond->falseNext;
                if(trueChild->numSuccessors() != 1) {
                    continue;
                }
                if(trueChild->incoming.size() != 1) {
                    continue;
                }
                if(trueChild->getSuccessor(0) != falseChild) {
                    continue;
                }

                unique_ptr<If> ifBlock(new If());
                migrateIncoming(cond, ifBlock.get());
                ifBlock->condition = cond->condition;
                ifBlock->trueBlock = trueChild;
                ifBlock->falseBlock = 0;
                ifBlock->next = falseChild;
                ifBlock->invertCondition = true;
                cout << "creating falseif" << endl;
                cout << "condition " << cond->id << endl;
                cout << "trueblock " << trueChild->id << endl;
                cout << "next " << falseChild->id << endl;

                trueChild->incoming.clear();
                trueChild->incoming.push_back(ifBlock.get());
                trueChild->replaceSuccessor(falseChild, 0);

                falseChild->replaceIncoming(trueChild, ifBlock.get());
                falseChild->removeIncoming(cond);

                eraseBlock(cond);
                blocks.push_back(std::move(ifBlock));
                foundFor = true;
                numChanges++;

                return true;
            }
        }
    }
    return numChanges > 0;
}
bool huntTrueIfElses(Block *block) {
    // an 'if' looks like (we're handling only the 'true' case ):
    // (something)
    // ConditionalBlock
    // true: BlockA => BlockC
    // false: BlockB => blockC
    int numChanges = 0;
    bool foundFor = true;
    while(foundFor) {
        foundFor = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(ConditionalBranch *cond = dynamic_cast<ConditionalBranch *>(block)) {
                Block *trueChild = cond->trueNext;
                Block *falseChild = cond->falseNext;
                if(trueChild->numSuccessors() != 1) {
                    continue;
                }
                if(trueChild->incoming.size() != 1) {
                    continue;
                }

                if(falseChild->numSuccessors() != 1) {
                    continue;
                }
                if(falseChild->incoming.size() != 1) {
                    continue;
                }

                if(falseChild->getSuccessor(0) != trueChild->getSuccessor(0)) {
                    continue;
                }

                Block *successor = falseChild->getSuccessor(0);
                unique_ptr<If> ifBlock(new If());
                migrateIncoming(cond, ifBlock.get());
                ifBlock->condition = cond->condition;
                ifBlock->trueBlock = trueChild;
                ifBlock->falseBlock = falseChild;
                ifBlock->next = successor;
                cout << "creating ifelse" << endl;
                cout << "condition " << cond->id << endl;
                cout << "trueblock " << trueChild->id << endl;
                cout << "falseblock " << falseChild->id << endl;

                trueChild->incoming.clear();
                trueChild->incoming.push_back(ifBlock.get());
                trueChild->replaceSuccessor(successor, 0);

                falseChild->incoming.clear();
                falseChild->incoming.push_back(ifBlock.get());
                falseChild->replaceSuccessor(successor, 0);

                successor->removeIncoming(trueChild);
                successor->removeIncoming(falseChild);
                successor->incoming.push_back(ifBlock.get());

                eraseBlock(cond);
                blocks.push_back(std::move(ifBlock));
                foundFor = true;
                numChanges++;
                return true;
            }
        }
    }
    return numChanges > 0;
}
bool huntDoWhiles(Block *block) {
    // an 'if' looks like (we're handling only the 'true' case ):
    // (something)
    // BlockA
    // ConditionalBlock
    // true: blockA
    // false: (doesnt matter)
    int numChanges = 0;
    bool foundFor = true;
    while(foundFor) {
        foundFor = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(ConditionalBranch *cond = dynamic_cast<ConditionalBranch *>(block)) {
                Block *trueChild = cond->trueNext;
                Block *falseChild = cond->falseNext;
                if(trueChild->numSuccessors() != 1) {
                    continue;
                }
                if(trueChild->getSuccessor(0) != cond) {
                    continue;
                }
                cout << "creating dowhile" << endl;

                Block *body = trueChild;
                unique_ptr<DoWhile> doWhile(new DoWhile());

                doWhile->body = body;
                doWhile->condition = cond->condition;
                doWhile->next = falseChild;
                cout << "body: " << body->id << endl;
                cout << "cond: " << cond->id << endl;
                cout << "next: " << doWhile->next->id << endl;

                migrateIncoming(body, doWhile.get());
                doWhile->removeIncoming(cond);

                body->incoming.clear();
                body->incoming.push_back(doWhile.get());
                body->replaceSuccessor(cond, 0);

                falseChild->removeIncoming(cond);
                falseChild->incoming.push_back(doWhile.get());

                // // check a bit
                // for(auto i=doWhile->incoming.begin(); i != doWhile->end(); i++) {
                //     Block *inc = *i;
                //     assert(ppinc->numSuccessors() == 1);
                //     assert(inc->getSuccessor(0) == doWhile);
                // }

                eraseBlock(cond);
                blocks.push_back(std::move(doWhile));
                foundFor = true;
                numChanges++;
                return true;
            }
        }
    }
    return numChanges > 0;
}
void huntWhiles(Block *block) {
    // BlockA
    // ConditonalBlock
    // true: BlockA
    // false: BlockB
}
bool huntForWithBreak(Block *block) {
    // for with break can look like:
    // blockA
    // cond
    // true:
    //    blockB
    //    cond
    //      true:
    //        (blockE)
    //        blockC
    //      false:
    //        (blockF)
    //        blockA
    //    (blockD ...)
    // false: blockC

    // there are at least two conditionals:
    // - the one for the loop
    // - the one around the `break`
    // there are at least three jumps:
    // - for the loop (into/leave)
    // - for the break if: continue the loop body, or break out of it
    // - ... we can probalby have a 'continue' instruction too...
    // as far as 'gotofree' requirements:
    // - blockE and blockC should probably be gotofree (?)
    // - blockF and blockA should probably be goto free (?)
    return false;
    int numChanges = 0;
    bool foundFor = true;
    while(foundFor) {
        foundFor = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(ConditionalBranch *cond = dynamic_cast<ConditionalBranch *>(block)) {

            }
        }
    }
    return numChanges > 0;
}
bool huntExitConditionals(Block *block) {
    // exit conditional looks like:
    // cond:
    //   true: (somehting)
    //   false: exit node
    // or:
    // cond:
    //    false: (something, => but must have no branches that leave <=)
    //    true: exit node
    // resulting if is *not* goto-free, but at least removes a conditional branch fro mthe system
    // in this functiion we handle the first case: false causes exit
    return false;
    int numChanges = 0;
    bool foundFor = true;
    while(foundFor) {
        foundFor = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(ConditionalBranch *cond = dynamic_cast<ConditionalBranch *>(block)) {
                // Block *falseChild = cond->falseNext;
                bool found = false;
                Block *exitNode = 0;
                Block *enterNode = 0;
                if(cond->falseNext->isExit) {
                    found = true;
                    exitNode = cond->falseNext;
                    enterNode = cond->trueNext;
                } else if(cond->trueNext->isExit) {
                    found = true;
                    enterNode = cond->falseNext;
                    exitNode = cond->trueNext;
                }
                if(!found) {
                    continue;
                }

                unique_ptr<If> ifBlock(new If());
                migrateIncoming(cond, ifBlock.get());
                ifBlock->condition = cond->condition;
                ifBlock->trueBlock = enterNode;
                ifBlock->falseBlock = exitNode;
                // no next/successor

                cout << "found an exitconditional" << endl;
                cout << "condition: " << cond->id << endl;
                cout << "enter node " << enterNode->id << endl;
                cout << "exit node: " << exitNode->id << endl;


                enterNode->incoming.clear();
                enterNode->incoming.push_back(ifBlock.get());

                exitNode->incoming.clear();
                exitNode->incoming.push_back(ifBlock.get());

                eraseBlock(cond);
                blocks.push_back(std::move(ifBlock));
                foundFor = true;
                numChanges++;
                return true;
            }
        }
    }
    return numChanges > 0;
}
bool huntFors(Block *block) {
    //BlockA
    //ConditionalBlock
    // true: BlockB => blockA
    // false: blockC
    // blockC
    int numChanges = 0;
    bool foundFor = true;
    while(foundFor) {
        foundFor = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(ConditionalBranch *cond = dynamic_cast<ConditionalBranch *>(block)) {
                if(cond->incoming.size() != 1) {
                    continue;
                }
                //Block *pre = cond->trueNext;
                Block *pre = cond->incoming[0];
                Block *body = cond->trueNext;
                // if(pre->incoming.size() != 1) {
                //     continue;
                // }
                if(!pre->gotoFree) {
                    continue;
                }
                if(!body->gotoFree) {
                    continue;
                }
                if(pre->numSuccessors() != 1) {
                    continue;
                }
                if(body->numSuccessors() != 1) {
                    continue;
                }
                if(body->getSuccessor(0) != pre) {
                    continue;
                }
                cout << "found a for :-)" << endl;
                cout << "pre: " << pre->id << endl;
                cout << "condition: " << cond->id << endl;
                cout << "body: " << body->id << endl;
                cout << "next: " << cond->falseNext->id << endl;

                unique_ptr<For> forBlock(new For());
                forBlock->preBlock = pre;
                forBlock->condition = cond->condition;
                forBlock->body = body;
                forBlock->next = cond->falseNext;

                migrateIncoming(pre, forBlock.get());
                forBlock->removeIncoming(body);

                // migrateIncoming(parent, forBlock.get());
                // vectorErase(forBlock->incoming, child);
                // for(auto parentincit = parent->incoming.begin(); parentincit != parent->incoming.end(); parentincit++) {
                //     Block *parentinc = *parentincit;
                //     if(parentinc != child) {
                //         // cout << "parentinc " << parentinc->id << endl;
                //         forBlock->incoming.push_back(parentinc);
                //         parentinc->replaceSuccessor(parent, forBlock.get());
                //     }
                // }

                pre->incoming.clear();
                pre->replaceSuccessor(cond, 0);
                pre->incoming.push_back(forBlock.get());

                body->replaceSuccessor(forBlock.get(), 0); // since we moved it earlier...
                body->incoming.clear();
                body->incoming.push_back(forBlock.get());

                forBlock->next->replaceIncoming(cond, forBlock.get());
                forBlock->gotoFree = true;

                eraseBlock(cond);
                blocks.push_back(std::move(forBlock));
                foundFor = true;
                numChanges++;
            }
        }
    }
    return numChanges > 0;
}



void runTransforms(Block *root, bool dumpTransforms) {
    //walk(root);
    if(dumpTransforms) {
        set<const Block *>seen;
        root->dump(seen, "");
    }

    // int numChanges = 1;
    bool madeChanges =  true;
    while(madeChanges > 0) {
        madeChanges = false;
        if(mergeSequences(root)) {
            // cout << "merge changes made" << endl;
            madeChanges = true;
            if(dumpTransforms) {
                set<const Block *>seen;
                root->dump(seen, "");
            }
        }

        if(huntExitConditionals(root)) {
            // cout << "merge changes made" << endl;
            madeChanges = true;
            if(dumpTransforms) {
                set<const Block *>seen;
                root->dump(seen, "");
            }
        }

        if(huntTrueIfs(root)) {
            madeChanges = true;
            if(dumpTransforms) {
                set<const Block *>seen;
                root->dump(seen, "");
            }
        }

        if(huntFalseIfs(root)) {
            madeChanges = true;
            if(dumpTransforms) {
                set<const Block *>seen;
                root->dump(seen, "");
            }
        }

        if(huntTrueIfElses(root)) {
            madeChanges = true;
            if(dumpTransforms) {
                set<const Block *>seen;
                root->dump(seen, "");
            }
        }

        // seen.clear();
        // root->dump(seen, "");
        if(huntFors(root)) {
            madeChanges = true;
            if(dumpTransforms) {
                set<const Block *>seen;
                root->dump(seen, "");
            }
        }

        if(huntDoWhiles(root)) {
            madeChanges = true;
            if(dumpTransforms) {
                set<const Block *>seen;
                root->dump(seen, "");
            }
        }

        // if(huntWhiles(root.get())) {
        //     madeChanges = true;
        //     seen.clear();
        //     root->dump(seen, "");
        // }

        // seen.clear();
        // root->dump(seen, "");
    }
    if(dumpTransforms) {
        set<const Block *>seen;
        root->dump(seen, "");
    }
    // cout << "after branching transforms:" << endl;
    // seen.clear();
    // root->dump(seen, "");
}

} // namespace cocl
