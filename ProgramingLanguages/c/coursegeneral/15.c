// demonstrates the system() and exit() functions
#include <stdio.h>
#include <stdlib.h> 

void main(void)
{
   // declare a buffer to hold input
   char input[40];

   // using while loop, repeat until the input
   // is NULL/empty
   while (1)
   {
          // prompt user for input
          puts("Input the desired DOS command, blank to exit");
		  // read and store the input to input variable
          gets(input);

          // exit if NULL
          if(input[0] == '\0')
              exit(0);

          // execute the command
          system(input);
   }
}