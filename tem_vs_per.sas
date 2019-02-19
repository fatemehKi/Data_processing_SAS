/*permanent creation*/
libname tt "C:\test";

data tt.first; /*make sure that you have put tt at first*/

input studentID fname $ lname $ Salary;

dataline;
1 john smith 50000
2 Mary Lee 60000
;
run;

/*temperoray creation*/
data first;

input studentID fname $ lname $ Salary;

dataline;
1 john smith 50000
2 Mary Lee 60000
;
run;
