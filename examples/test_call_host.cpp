#include <iostream>
using namespace std;

float someHostFunction(float input);

int main(int argc, char *argv[]) {
    float result = someHostFunction(4.56f);
    cout << "result " << result << endl;
    return 0;
}
