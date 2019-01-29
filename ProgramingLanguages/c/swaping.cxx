//swap 


#include <iostream>

//template




void exchange(int &a, int &b)
{
	int temp;
	temp = a;
	a = b;
	b = temp;
}



int main(int argc, char **argv)
{
	int x = 5, y = 3;
	std::cout << "X is " << x << " Y is " << y<< std::endl;
	exchange(x,y);
	std::cout << "After the swap"<<std::endl;
	std::cout << "X is " << x << " Y is " << y<< std::endl;
	
	return 0;
}

