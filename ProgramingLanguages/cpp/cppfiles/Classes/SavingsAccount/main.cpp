#include <iostream>
#include <string>
#include "Bank.h"


int main()
{
    int i;
    std::cout << "Welcome to Happy Banking!" << std::endl;
    SavingsAccount sa1("sa1","GR0123456789");
    SavingsAccount sa2("sa2","GR0123456798",1000,"2310112233");
    sa1.deposit(100);
    sa1.Show();
    sa2.withdraw(1200);
    sa2.Show();
    sa2.setContactPhone("2310998877");
    sa2.Show();
    for (i=1;i<10;i++)
    {
        sa1.withdraw(15);
        sa1.CalcCost();
        std::cout << sa1.getBalance() <<std::endl;
    }

    Bank b;
    b.InsertAccount(sa1);
    b.InsertAccount(sa2);



    b.CreateAccount("kimon","GR01234",420,"2310000",1);
    std::cout << b.FindAccount("GR01234");
    std::cout << "Find which account has this IBAN " << sa2.getIBAN() << std::endl;
//    std::cout << "This IBAN has an index of " << b.FindAccount(sa2.getIBAN()) << "and "
//    "belongs to " << b.accounts[b.FindAccount(sa2.getIBAN())].getOwner()  << std::endl;

    std::cout << "This IBAN has an index of " << b.FindAccount(sa2.getIBAN()) << std::endl;

    return 0;
}
