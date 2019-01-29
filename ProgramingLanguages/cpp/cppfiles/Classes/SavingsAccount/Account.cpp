#include "Account.h"
#include <iostream>

Account::Account()
{
    Owner = "None";
    IBAN = "None";
    Balance = 0;
    ContactPhone = "None";
    NumberOfTransactions = 0;
}
Account::Account(std::string Owner0, std::string IBAN0, double Balance0, std::string ContactPhone0)
{
    Owner = Owner0;
    IBAN = IBAN0;
    Balance = Balance0;
    ContactPhone = ContactPhone0;
    NumberOfTransactions = 0;
    //std::cout << "SavingAccount object created" << std::endl;
}


Account::Account(std::string Owner0, std::string IBAN0)
{
    Owner = Owner0;
    IBAN = IBAN0;
    Balance = 0;
    ContactPhone = "None";
    NumberOfTransactions = 0;
}

std::string Account::getOwner()
{
    return Owner;
}

std::string Account::getIBAN()
{
    return IBAN;
}

double Account::getBalance()
{
    return Balance;
}

std::string Account::getContactPhone()
{
    return ContactPhone;
}

void Account::setContactPhone(std::string ContactPhone0)
{
    ContactPhone = ContactPhone0;
}


void Account::deposit(double Amount0)
{
    Balance += Amount0;
    NumberOfTransactions++;
}

void Account::withdraw(double Amount0)
{
    if (Balance >= Amount0)
    {
        Balance -= Amount0;
        NumberOfTransactions++;
    }
    else
    {
        std::cout << "Withdrawal unsuccessful, insufficient amount, balance is " << Balance << std::endl;
    }

}

void Account::Show()
{
    std::cout << "Name:" << Owner << "\n" << std::endl;
    std::cout << "IBAN:" << IBAN << "\n" << std::endl;
    std::cout << "Balance:" << Balance << "\n" << std::endl;
    std::cout << "Contact:" << ContactPhone << "\n" << std::endl;
}


void Account::CalcCost()
{

    if (Balance == 0.0)
    {
        std::cout << "Insufficient Balance!!!"<<std::endl;
    }
    else if (Balance < Cost)
    {
        Account::withdraw(Balance);
        std::cout << "Balance reduced to 0 because of recuring costs"<<std::endl;
    }
    else if (Balance <MinimumBalance)
    {
        Account::withdraw(2.0);
        std::cout << "Balance reduced by 2.0 because funds below Minimum "<<std::endl;
    }

}

double Account::MinimumBalance = 100.0;
double Account::Cost = 2.0;
