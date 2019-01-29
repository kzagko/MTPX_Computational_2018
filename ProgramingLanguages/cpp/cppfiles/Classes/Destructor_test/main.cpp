#include <iostream>


class Vector3d
{
    public:
        int x,y,z;
        Vector3d(int a, int b, int c)
        {
            x=a; y=b; z=c;

        }

};

//overload operator + for 3d vectors
Vector3d operator+(Vector3d v, Vector3d w)
{
    Vector3d result(v.x+w.x,v.y+w.y,v.z+w.z);
    return result;

}

//overload cout to print vectors

std::ostream& operator<<(std::ostream& o, Vector3d& v)
{
    o << "(" << v.x << "," << v.y << "," << v.z << ")";
    return o;
}


class Test
{
    int x;
    int y;

    public:
        Test()
        {
            std::cout << "Test created \n";
        }

        ~Test()
        {
            std::cout << "Bye bye world :( \n";
        }

};

int main()
{
    std::cout << "Hello world!" << std::endl;

    Test a;
    std::cin.get();
    Test b[3];
    std::cin.get();

    {
        Test c;
        std::cin.get();

    }

    std::cin.get();

    Test c = a;
    std::cin.get();

    Test* d = new Test[10];
    std::cin.get();

    {
        Test* e = new Test[3];
        std::cin.get();
    }

    delete [] d;
    d = nullptr;

    Vector3d a1(1,2,3);
    Vector3d b1(4,5,6);
    Vector3d c1 = a1+b1;
    std::cout << a1.x <<" "<< a1.y <<" "<< a1.z <<"\n"<<std::endl;
    std::cout << b1.x <<" "<< b1.y <<" "<< b1.z <<"\n"<<std::endl;
    std::cout << c1.x <<" "<< c1.y <<" "<< c1.z <<"\n"<<std::endl;
    std::cout <<a1 <<b1<<c1<<std::endl;
    return 0;
}
