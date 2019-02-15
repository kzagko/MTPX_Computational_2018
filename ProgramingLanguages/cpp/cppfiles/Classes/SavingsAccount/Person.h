#ifndef PERSON_H
#define PERSON_H
#include <string>

class Person
{
public:
    Person();
    Person(std::string,std::string);
    void setPhone(std::string);
    void setName(std::string);
    std::string getName();
    std::string getPhone();
protected:

private:

    std::string Name;
    std::string Phone;


};

#endif // PERSON_H
