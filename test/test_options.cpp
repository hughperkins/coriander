#include "cocl/options.h"

#include <iostream>
using namespace std;

int main(int argc, char *argv[]) {
    string requiredstring = "";
    bool somebool = false;
    string somestring = "";
    int someint = 0;
    float somefloat = 0.0f;
    cocl::ArgumentParser parser;
    parser.add_string_argument("--requiredstring", &requiredstring)->required();
    parser.add_bool_argument("--somebool", &somebool);
    parser.add_string_argument("--somestring", &somestring)->help("this should be a string");
    parser.add_int_argument("--someint", &someint);
    parser.add_float_argument("--somefloat", &somefloat);
    if(!parser.parse(argc, argv)) {
        return -1;
    }
    cout << "requiredstring " << requiredstring << endl;
    cout << "somebool " << somebool << endl;
    cout << "somestring " << somestring << endl;
    cout << "someint " << someint << endl;
    cout << "somefloat " << somefloat << endl;
    return 0;
}
