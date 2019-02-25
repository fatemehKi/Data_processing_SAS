libname lbfmt 'C:\test';
proc format library=lbfmt.age;
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
  value $co
    'Y'='Yellow'
	'G'='Gray  '
	'B'='Blule '
	'W'='White '
	;
run;

data test;
  input fname $ lname $ sex dob empdate;
  informat dob empdate mmddyy6.;
datalines;
Johon Martin 1 123069 100172
Mary  Smith  2 101072 110292
;
run;

data test1;
  set test;
  format dob empdate date9.;
run;

proc print data=test;
  format dob empdate date9.;
run;


data test;
  input fname $ lname $ sex dob empdate age;
  informat dob empdate mmddyy6.;
datalines;
Johon Martin 1 123069 100172 49
Mary  Smith  2 101072 110292 40
;
run;

options fmtsearch= (lbfmt.age);
proc print data=test;
  /*format dob empdate date9.;*/
  var age;
  format age agegroup.;
run;

DATA TRAVEL;
  INPUT COUNTRY $12. AIRCOST VENDOR $9. NUM_PEOPLE;
CARDS;
France       575 Express  10
Spain        510 World    12
Brazil       540 World     6
India        489 Express   .
Japan        720 Express  10
Greece       698 Express  20
New Zealand 1489 Southsea  6
Venezuela    425 World     8
Italy        468 Express   9
USSR         924 World     6
Switzerland  734 World    20
Australia   1079 Southsea 10
Ireland      558 Express   9
;
RUN;

