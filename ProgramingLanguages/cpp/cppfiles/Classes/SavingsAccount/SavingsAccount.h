#ifndef SAVINGSACCOUNT_H
#define SAVINGSACCOUNT_H
#include <iostream>
#include <string>
#include "Account.h"

class SavingsAccount : public Account
{
    public:
//        static double MinimumBalance;
//        static double Cost;
        SavingsAccount();
        //Constractor with all elements
//        SavingsAccount(std::string Owner0, std::string IBAN0, double Balance0, std::string ContactPhone0);
//        //Constractor with only Owner and IBAN
//        SavingsAccount(std::string Owner0, std::string IBAN0);
//        // Get members
//        std::string getOwner();
//        std::string getIBAN();
//        std::string getContactPhone();
//        double getBalance();
//        void setContactPhone(std::string ContactPhone0);
//        void deposit(double Amount0);
//        void withdraw(double Amount0);
//        void Show();
        void CalcCost();

    protected:

    private:
//        std::string Owner;
//        std::string IBAN;
//        std::string ContactPhone;
//        double Balance;
        int NumberOfTransactions;

};

#endif // SAVINGSACCOUNT_H
