#include <iostream>

#include "cuda.h"

#include <iostream>
using namespace std;

int main(int argc, char *argv[]) {
    CUcontext formercontext;
    cuCtxGetCurrent(&formercontext);
    cout << "former context " << formercontext << endl;

    CUcontext a;
    cuCtxCreate_v2(&a, 0, 0);
    cout << "a " << a << endl;

    cuCtxSetCurrent(formercontext);
    cuCtxGetCurrent(&formercontext);
    cout << "former context " << formercontext << endl;

    // CUcontext b;
    // cuCtxCreate_v2(&b, 0, 0);
    // cout << "b " << b << endl;
}
