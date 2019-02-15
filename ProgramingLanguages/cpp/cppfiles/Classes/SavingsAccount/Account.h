#ifndef ACCOUNT_H
#define ACCOUNT_H
#include <iostream>
#include <string>
#include"Person.h"

class Account
{
public:
    static double MinimumBalance;
    static double Cost;
    Account();
    //Constractor with all elements
    Account(Person, std::string, double);

    // Get members

    std::string getIBAN();
    void setIBAN(std::string);
    double getBalance();
    void setBalance(double);
    void deposit(double);
    void withdraw(double);
    void Show();

    virtual void CalcCost() = 0; //this is virtual it gets overiden in children

protected:

    std::string IBAN;
    Person person;
    double Balance;
    int NumberOfTransactions;

private:



};

#endif // ACCOUNT_H
