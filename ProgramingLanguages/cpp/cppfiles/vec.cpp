#include <iostream>
#include <vector>
#include <ctime>
#include <cstdlib>

using namespace std;

int main() {
	srand(time(0));
	int size;
	cin >> size;
	vector<int> a(size,0);

	for(int i=0; i<size; i++){
		a[i]= rand()%100;
	}

	for(int x:a){
		cout << x << " ";
	}
	cout<<endl;
	a.at(12) = 1;
	int k;
	while((k=rand()%30 -2) >0){
		a.push_back(k);
	}
	for(auto x:a){
		cout << x << " ";
	}
	cout << "\nSize: " << a.size() << endl;
	return 0;
}
