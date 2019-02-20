/*we need to have informat for the date*/
/*totally changing the data format*/
data test;
input fname $ lname $ sex dob empdate;
informat dob empdate mmddyy6.;
dataline;
john martin 1 123069 100172
;
run;

/*does not change the format, it just print*/
proc print data=test;
format dob empdate date6.;
run;
