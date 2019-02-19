/*temperoray creation*/
data first;

input studentID fname $ lname $ Salary;

dataline;
1 john smith 50000
2 Mary Lee 60000
;
run;

/*permanent creation*/
libname tt "C:\test";

data tt.first;

input studentID fname $ lname $ Salary; 
/*the $ sign for the character is required to have an space*/

dataline;
1 john smith 50000
2 Mary Lee 60000
;
run;

proc print data=tt.first; /*tt means the library and first is the dataset*/
run; 

proc means data tt.first;
var salary;
run;

