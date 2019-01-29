#include <iostream>
#include <fstream>
#include <vector>
#include <ctime>
#include <cstdlib>

using namespace std;

void swap(int *A, int *B){
    int temp = *A;
    *A = *B;
    *B = temp;
}

void BubbleSort(vector<int> &arr, int n){
   int i, j;
   bool swapped;
   for (i = 0; i < n-1; i++){
     swapped = false;
     for (j = 0; j < n-i-1; j++){
        if (arr[j] > arr[j+1]){
           swap(&arr[j], &arr[j+1]);
           swapped = true;
        }
     }
     if (swapped == false){
        break;
      }
   }
}


int main() {
	srand(time(0));
	int size;
	cin >> size;
	vector<int> a(size,0);

	for(int i=0; i<size; i++){
		a[i]= rand()%999 + 1;
	}

	BubbleSort(a,size);
	ofstream myfile ("array.txt");
  for(int i=0; i<size; i++){
    myfile << a[i] << "\n";
  }
  myfile.close();
	return 0;
}
