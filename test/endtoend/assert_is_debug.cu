// since our tests use assert, if the tests are not debug builds, then asserts wont fail, and tests will appear to pass
// so we check that asserts work

#include <iostream>


int main(int argc, char *argv[]) {

    #ifdef NDEBUG
    throw std::runtime_error("NDEBUG defined. Should not be, otherwise asserts wont work");
    #endif

    assert(false);

    // try {
    //     assert(false);
    // } catch(...) {
    //     std::cout << "caught exception" << std::endl;
    // }

    return 0;
}
