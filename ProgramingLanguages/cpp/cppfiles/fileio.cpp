#include <iostream>
#include <iomanip>
#include <fstream>


using namespace std;

int main() {

	double mix;
	std::ofstream myfile("out.txt");
	
	myfile << "hello" << 42 << std::endl;
	
	for (int i=0; i<10; i++){
		myfile << setw(12-i) << i << endl;
	}
	
	ifstream f("test.txt");
	int value = 5;
	f >> value;
	cout << value << endl;
	while(f >> value){
		cout << value << " ";
	}

	return 0;/**/
}

