data first;

input studentID fname $ lname $ Salary; 
/*the $ sign for the character is required to have an space*/

dataline; /*the record of dataset coming after this word*/
1 john smith 50000
2 Mary Lee 60000
; 
run; /*the line above is required*/

data two;
set first;
bonus = salary*0.1;
run;
proc print data=two; /*tt means the library name and first is the dataset*/
run; 

