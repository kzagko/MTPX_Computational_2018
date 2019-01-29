#include <iostream>

using namespace std;

int main() {
	int a = 5;
	int& x = a;
	cout << "x= " << x << " a= " << a << endl;
	x = 42;
	cout << "x= " << x << " a= " << a << endl;
	a = 23;
	cout << "x= " << x << " a= " << a << endl;
}

