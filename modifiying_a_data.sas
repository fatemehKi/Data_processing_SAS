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


proc print data=two; /*printing the summation of the salary*/
sum salary bouns;
run; 


/*where condition: */
data europeancar;
  set sashelp.cars; /*library name sashelp and the data set is cars*/
  where origin = "Europe"; /*it is case snsitive for chars*/
run;

proc print data= europeancar;
run;

/************salary beyond 50K*/
data three;
set tt.first;
where salary > 50000;
run;

proc print data=three;
run;

/*from the other table which is temp not permanent*/
data four;
set work.Two;
where (salary+bonus) > 50000;
run;

proc print data=four;
run;


/* in order to remove no*/
proc print data europeancar noobs;
run;


/* data steps vs --- proc steps:
1. begins with data statments --- begins with proc statments
2. read and modify data ---- perform specifix analysis or function
3. create a SAS data set ---- produce results or report
*/ 
/* we only have two type of variables : numeric vs character.. 
we need $ sign after character
if we are missing a numeric value we need to use '.' dot (instead of null)
and for the character it is blank*/

/******************important***************************/
/*contents provide us the general information of a dataset*/
proc contents data=sashelp.cars;
run;
