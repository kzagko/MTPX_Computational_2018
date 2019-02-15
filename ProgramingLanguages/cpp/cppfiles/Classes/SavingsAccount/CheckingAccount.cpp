#include "CheckingAccount.h"

CheckingAccount::CheckingAccount(Person person1, std::string IBAN0, double balance0)
{
    person = person1;
    IBAN = IBAN0;
    Balance = balance0;
    NumberOfTransactions = 0;

}



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

double CheckingAccount::CostPerTransaction = 2.0;

