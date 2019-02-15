#include "Person.h"

Person::Person()
{
    //ctor
}
Person::Person(std::string Name1,std::string Phone1)
{
    Name = Name1;
    Phone = Phone1;
}


void Person::setPhone(std::string Phone1)
{
    Phone = Phone1;

}

void Person::setName(std::string Name1)
{
    Name = Name1;

}

std::string Person::getName()
{
    return Name;
}

std::string Person::getPhone()
{
    return Phone;
}
