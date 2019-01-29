#include <iostream>

using namespace std;

template<typename T> 
void exchange(T& a, T& b){
	T temp = a;
	a = b;
	b = temp;
}

int main(int argc, char** argv) {
	double x = 65.2, y = 73.6;
	cout << "x= " << x << " y= " << y << endl;	
	exchange<double>(x,y);
	cout << "x= " << x << " y= " << y << endl;
	return 0;
}

