#include "SavingsAccount.h"

SavingsAccount::SavingsAccount(Person person1, std::string IBAN0, double balance0)
{
    person = person1;
    IBAN = IBAN0;
    Balance = balance0;
    NumberOfTransactions = 0;

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
