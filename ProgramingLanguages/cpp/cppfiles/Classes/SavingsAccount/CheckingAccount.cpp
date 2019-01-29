#include "CheckingAccount.h"

CheckingAccount::CheckingAccount()
//{
//    Owner = "None";
//    IBAN = "None";
//    Balance = 0;
//    ContactPhone = "None";
//    NumberOfTransactions = 0;
//}
//CheckingAccount::CheckingAccount(std::string Owner0, std::string IBAN0, double Balance0, std::string ContactPhone0)
//{
//    Owner = Owner0;
//    IBAN = IBAN0;
//    Balance = Balance0;
//    ContactPhone = ContactPhone0;
//    NumberOfTransactions = 0;
//    //std::cout << "SavingAccount object created" << std::endl;
//}
//
//
//CheckingAccount::CheckingAccount(std::string Owner0, std::string IBAN0)
//{
//    Owner = Owner0;
//    IBAN = IBAN0;
//    Balance = 0;
//    ContactPhone = "None";
//    NumberOfTransactions = 0;
//}
//
//std::string CheckingAccount::getOwner()
//{
//    return Owner;
//}
//
//std::string CheckingAccount::getIBAN()
//{
//    return IBAN;
//}
//
//double CheckingAccount::getBalance()
//{
//    return Balance;
//}
//
//std::string CheckingAccount::getContactPhone()
//{
//    return ContactPhone;
//}
//
//void CheckingAccount::setContactPhone(std::string ContactPhone0)
//{
//    ContactPhone = ContactPhone0;
//}
//
//
//void CheckingAccount::deposit(double Amount0)
//{
//    Balance += Amount0;
//    NumberOfTransactions++;
//}
//
//void CheckingAccount::withdraw(double Amount0)
//{
//    if (Balance >= Amount0)
//    {
//        Balance -= Amount0;
//        NumberOfTransactions++;
//    }
//    else
//    {
//        std::cout << "Withdrawal unsuccessful, insufficient amount, balance is " << Balance << std::endl;
//    }
//
//}
//
//void CheckingAccount::Show()
//{
//    std::cout << "Name:" << Owner << "\n" << std::endl;
//    std::cout << "IBAN:" << IBAN << "\n" << std::endl;
//    std::cout << "Balance:" << Balance << "\n" << std::endl;
//    std::cout << "Contact:" << ContactPhone << "\n" << std::endl;
//}


void CheckingAccount::CalcCost()
{

    if (NumberOfTransactions >= 2)
    {
        double TotalCost = CostPerTransaction*(NumberOfTransactions-2);

    if (Balance == 0.0)
    {
        std::cout << "Insufficient Balance!!!"<<std::endl;
    }
    else if (Balance < TotalCost)
    {
        CheckingAccount::withdraw(Balance);
        std::cout << "Balance reduced to 0 because of transaction costs"<<std::endl;
    }
    else
    {
        CheckingAccount::withdraw(TotalCost);
        std::cout << "Balance reduced by " << TotalCost << " because of transaction costs "<<std::endl;
    }

    }
}

//double CheckingAccount::MinimumBalance = 100.0;
//double CheckingAccount::Cost = 2.0;
double CheckingAccount::CostPerTransaction = 2.0;

