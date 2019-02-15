#include "Account.h"
#include <iostream>

Account::Account()
{
    IBAN = "None";
    Balance = 0;
    NumberOfTransactions = 0;
}

Account::Account(Person person1, std::string IBAN0, double Balance0)
{
    person = person1;
    IBAN = IBAN0;
    Balance = Balance0;
    NumberOfTransactions = 0;

}

std::string Account::getIBAN()
{
    return IBAN;
}

void Account::setIBAN(std::string IBAN0)
{
    IBAN = IBAN0;
}


double Account::getBalance()
{
    return Balance;
}

void Account::setBalance(double balance0)
{
    Balance = balance0;
}

void Account::Show()
{
    std::cout << "Name:" << person.getName() << "\n" << std::endl;
    std::cout << "IBAN:" << IBAN << "\n" << std::endl;
    std::cout << "Balance:" << Balance << "\n" << std::endl;
    std::cout << "Contact:" << person.getPhone() << "\n" << std::endl;
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





double Account::MinimumBalance = 100.0;
double Account::Cost = 2.0;
