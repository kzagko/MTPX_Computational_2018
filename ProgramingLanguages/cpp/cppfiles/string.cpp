#include <iostream>
#include <string>

using namespace std;

int main(int argc, char** argv) {
	string a("Hello");
	string b = "World";
	string c = a + b;
	cout << c << endl;
	cout << a << " " << b << "\t" << 42 << endl;
	char d[] = "old C style.";
	c = d;
	string e(d);
	cout << d << e << endl;
	
	bool k = 3 < 1;
	cout << k << (13 > 2) << true << false << 2 + true << endl;
	if(k) cout << "Correct";
	else cout << "Wrong";
	
	cout << endl;
	a = "test"; b = "test";
	char f[] = "old C style.";
	cout << (d==f) << endl;
	cout << (a==b) << endl;
	//cout << d + f << endl;
	return 0;
}
