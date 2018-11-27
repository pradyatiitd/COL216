# COL216
## Programming Assignment-2
This assignment involves writing ARM assembly language program to generate Happy Numbers and storing these in a file. 
Information on Happy Numbers can be found [here](https://en.wikipedia.org/wiki/Happy_number). File input/output in 
ARMSim# is done using ‘swi’ instructions, as described in
section 8 of ARMSim User Guide. A program in C for generating Happy Numbers with up to 4 digits is being provided. This exploits
the fact that 1 and 7 are the only two Happy Numbers with a single digit. Here the numbers are stored in binary coded decimal 
(BCD) form - one digit per word. In assembly language, one byte could be used for storing one digit.
