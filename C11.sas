
libname sasdata 'C:\test' ;
proc format library=sasdata;
    value agegroup
    low-35='<36 years'
	36- 45='36-45    '
	46- 55='46-55    '
	56-high='55+     '
	;
  value genderg
    1='F'
	2='M'
	;
run;


data test;
  input fname $ lname $ sex dob empdate age;
  informat dob empdate mmddyy6.;
datalines;
Johon Martin 1 123069 100172 49
Mary  Smith  2 101072 110292 40
;
run;

libname library 'C:\test' ;
libname sasdata 'C:\test' ;
proc print data=test;
  /*format dob empdate date9.;*/
  var age;
  format age agegroup.;
run;

