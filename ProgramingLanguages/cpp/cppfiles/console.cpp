#include <iostream>
#include <iomanip>

using namespace std;

int main(int argc, char** argv) {
	// OUTPUT
	cout<< "Hello world\n";
	cout<<setw(10)<<"ten"<<setfill('-')<<setw(10)<<"four"<<setw(6)<<"four"<<"stop";
	cout<<"hello"<<endl;
	cout<<left<<setw(10)<<42<<endl;
	int pr = cout.precision();
	cout << setprecision(3) << 2.71828 << endl;
	cout << 3.141596<<endl;
	cout << 0.00042123 <<" " << 0.0000042123 << endl;
	cout <<setbase(16)<<42<<" "<<123456<<endl;
	cout << 10+20 << endl;
	cout << 18.45268 << "\n" << setprecision(pr) << 18.45268 << endl;
	cout<< pr << endl;
	cout << setprecision(3) << 1.0/3.0 << endl;
	cout << setprecision(20) << 1.0/3.0 << endl;
	cout << setprecision(20) << 1.0/10.0 << endl;
	cout << 42 << endl;
	// INPUT
	int x, y, z;
	cout <<"Enter 3 integers: \n";
	cin >> x >> y >> z;
	cout << "Mean: " << (x+y+z)/3.0 << endl;
	return 0;
	/*
	*/
}

