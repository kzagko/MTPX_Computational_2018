#include "SavingsAccount.h"

SavingsAccount::SavingsAccount()
{
    Owner = "None";
    IBAN = "None";
    Balance = 0;
    ContactPhone = "None";
    NumberOfTransactions = 0;
}
SavingsAccount::SavingsAccount(std::string Owner0, std::string IBAN0, double Balance0, std::string ContactPhone0)
{
    Owner = Owner0;
    IBAN = IBAN0;
    Balance = Balance0;
    ContactPhone = ContactPhone0;
    NumberOfTransactions = 0;
    //std::cout << "SavingAccount object created" << std::endl;
}


SavingsAccount::SavingsAccount(std::string Owner0, std::string IBAN0)
{
    Owner = Owner0;
    IBAN = IBAN0;
    Balance = 0;
    ContactPhone = "None";
    NumberOfTransactions = 0;
}

std::string SavingsAccount::getOwner()
{
    return Owner;
}

std::string SavingsAccount::getIBAN()
{
    return IBAN;
}

double SavingsAccount::getBalance()
{
    return Balance;
}

std::string SavingsAccount::getContactPhone()
{
    return ContactPhone;
}

void SavingsAccount::setContactPhone(std::string ContactPhone0)
{
    ContactPhone = ContactPhone0;
}


void SavingsAccount::deposit(double Amount0)
{
    Balance += Amount0;
    NumberOfTransactions++;
}

void SavingsAccount::withdraw(double Amount0)
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

void SavingsAccount::Show()
{
    std::cout << "Name:" << Owner << "\n" << std::endl;
    std::cout << "IBAN:" << IBAN << "\n" << std::endl;
    std::cout << "Balance:" << Balance << "\n" << std::endl;
    std::cout << "Contact:" << ContactPhone << "\n" << std::endl;
}


void SavingsAccount::CalcCost()
{

    if (Balance == 0.0)
    {
        std::cout << "Insufficient Balance!!!"<<std::endl;
    }
    else if (Balance < Cost)
    {
        SavingsAccount::withdraw(Balance);
        std::cout << "Balance reduced to 0 because of recuring costs"<<std::endl;
    }
    else if (Balance <MinimumBalance)
    {
        SavingsAccount::withdraw(2.0);
        std::cout << "Balance reduced by 2.0 because funds below Minimum "<<std::endl;
    }

}

double SavingsAccount::MinimumBalance = 100.0;
double SavingsAccount::Cost = 2.0;
