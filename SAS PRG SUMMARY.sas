/* PART I - PROC */

/* Proc print */

data test;
  input fname $ lname $ sex $ dob empdate age income;
  informat dob empdate mmddyy6.;
datalines;
Johon Martin M 123069 100172 49 60000
Mary  Smith  F 101072 110292 40 40000
;
run;

proc print data=test;
  format dob empdate date9. ;
run;

/* Proc format */
proc format;
    value agegroup
    low-35='<36 years'
	36- 45='36-45    '
	46- 55='46-55    '
	56-high='55+     '
	;
run;

proc print data=test;
  format dob empdate date9. age agegroup.;
run;

libname sasdata 'C:\SAS Course\SAS Fundamental\SAS_F' ;
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

libname library 'C:\SAS Course\SAS Fundamental\SAS_F' ;

proc print data=test;
  /*format dob empdate date9.;*/
  var age;
  format age agegroup.;
run;

/* Proc import */

PROC IMPORT DATAFILE='C:\SAS_F\book1.CSV'
OUT = WORK.book
DBMS=CSV
REPLACE;
GETNAMES=YES;
RUN;

/* Proc means */

proc means data=test maxdec=2;
  var age income;
  class sex age;
  format age agegroup.;
run;

/* Proc summary */
proc summary data=test;
  var age income;
  output out=sumdata;
run;
proc print data=sumdata;
run;

/* Proc univariate */
proc univariate data=test;
  var age income;
run;

proc univariate data=test normal freq plot;
  var income;
  output out=summary_income;
run;
proc print data=summary_income;
run;

/* Proc freq */

proc freq data=test;
  table sex*age;
  format age agegroup.;
run;

/* Proc sort */

proc sort data=test;
  by sex;
run;

/* Proc Append */

PROC APPEND BASE =FF
			DATA=test;
Run;

/* PART II - FUNCTION */

/* compress */
data _NULL;
  Address="2000 Eglinton-Ave. MissiSsauga L5J'4L0";
  New_add=compress(Address,",.-'");
run;

/* scan trim SUBSTR & intck */

data ts;
full_name='Stephen Goodnight';
New_name=trim(scan(full_name,2)) ||','|| trim(scan(full_name,1));
Fname=SUBSTR(full_name, 1, 8);
Lname=SUBSTR(full_name, 9, 18);

dob='02JUN1968'd;

Years=intck('year',dob,today());
quarters=intck('qtr',dob,today());
months=intck('month',dob,today());
weeks=intck('week',dob,today());
days=intck('day',dob,today());
run;
proc print data=ts;run;

/* mean sum round int */
data one;
 input x1-x4;
 cards;
 1 2 3 4 
 13.75 . 5 7
 0.5 . . 8
 ;
run;

data sums;
 set one;
 total1 = x1 + x2 + x3 + x4;
 total2 = sum(of x1-x4);
 total3 = sum(x1, x2, x3, x4);

 mean1 = (x1+x2+x3+x4)/4;
 mean2 = mean(of x1-x4);
 mean3 = mean(x1, x2, x3, x4);

 round1 = round(x1);
 round2 = round(x1,1);
 round3 = round(x1,0.1);
 round4 = round(x1,0.01);
 int = int(x1);

run;

proc print data = sums;
run;

/* PART III - DATA STEP */
/* input */

data C2_P3;
  length c_id $10 fname $25 lname $20 gender $1 e_status $1 h_phone $10;
  informat dob mmddyy6.;
  input c_id fname lname dob gender e_status income n_family h_phone;
cards;
0001 Even Yin 022962 M 0 1500.00 3 416-4985870
;
run;

data C3_P2;
  input 
  @1 name $8. 
  @9 class_num 2.
  @12 sale_date mmddyy10.
  @22 candy_type $2.  
  @25 box_num 2.
  ;
datalines;
Adrian  21 3/21/2012 MP 7
Nathan  14 3/20/2012 CD 19
Matthew 14 3/22/2012 CD 14
Claire  14 3/22/2012 CD 11
Ian     21 3/24/2012 MP 18
Chris   14 3/25/2012 CD 6
Anthony 21 3/25/2012 MP 13
Erica   21 3/25/2012 MP 17
;
run;

proc print data=C3_P2;
  format sale_date date9.;
run;

/* Input by using infile */

data contest;
  infile 'C:\SAS_F\sasdata\AG13.txt';
  input name $ age type $ date mmddyy10. 
        score1 score2 score3 score4 score5;
  avg_score=mean(of score1 - score5);
  dayentered=day(date);
  type=upcase(type);
  format date date9.;
run;
proc print data=contest;
run;

/* if condition then action */

 data school;
   input age quiz : $1. m_score f_score;
   cards;
   12 A 92 95
   12 B 88 88
   13 C 78 75
   13 A 92 93
   12 F 55 62
   13 B 88 82
   ;
run;
data new;
  set school;
       if age<=12 then grade=6;
  else if age<=13 then grade=8;
  else                 grade=9;
       if quiz='A' then score=95;
  else if quiz='B' then score=85;
  else if quiz='C' then score=75;
  else if quiz='D' then score=70;
  else if quiz='F' then score=65;
  else                  score=.;

  term_score=score*0.2+m_score*0.3+f_score*0.5;
run;
proc print data=new;
run;

/* retain */
data one; 
 input x @@;
 cards;
 1 4 8 8 5
 ;
run;

data tryagain;
 set one end=last;
 retain sum_x 0 sum_xq 0 prod_x 1;
 sum_x = sum_x + x;
 sum_xq = sum_xq + x**2;
 prod_x = prod_x * x;
 if last = 1;  /*equivalent to: if last = 0 then delete;*/
run;

proc print;run;

data gamestats;
  input month 1 day 3-4 team $ 6-24 hits 27-28 runs 30-31;
datalines;
6-19 Columbia Peaches     8  3
1-20 Columbia Peaches     10 5
6-23 Plains Peanus        3  4
;
run;
proc print data=gamestats; run;
data gamestats1;
  set gamestats;
  retain Maxruns;
  Maxruns=max(Maxruns, runs);
  runstotal + runs;
;
run;
proc print data=gamestats1;
run;

/* DO LOOP */
data table;
  do n=1 to 10;
    square=n*n;
	squareroot=sqrt(n);
  output;
  end;
run;

data CtoF6;
  C=1;
  do while(C<=50);
  F=round((9/5*c+32),0.1);
  output;
  C=C+2;
  end;
run;

data CtoF7;
  C=1;
  do until(C>50);
  F=round((9/5*c+32),0.1);
  output;
  C+2;
  end;
run;

/* array */

data array_style;
  input x1 - x7;
  array F(7) x1 - x7;
    do I=1 to 7;
	  if F(I)=9 then F(I)=.;
	end;
	drop I;
datalines;
1 2 3 4 9 8 7
7 8 9 5 4 3 2 
;
run;


data array_style;
  input x1 - x7;
  array F(*) x1 - x7;
    do I=1 to dim(F);
	  if F(I)=9 then F(I)=.;
	end;
	drop I;
datalines;
1 2 3 4 9 8 7
7 8 9 5 4 3 2 
;
run;


data array_style;
  input x1 - x7;
  array F x1 - x7;
    do over F;
	  if F=9 then F=.;
	end;
datalines;
1 2 3 4 9 8 7
7 8 9 5 4 3 2 
;
run;

data test;
  input (q1 - q5) ($1. +1);
  SCORE=0;
  array q q1 - q5;
  array a $1 a1 - a5 ('A' 'B' 'C' 'D' 'B');
    DO OVER Q;
	  IF Q=A THEN SCORE+1;
	END;
DATALINES;
A C D B E
E B A D C
C B B A D
;
RUN;
PROC PRINT DATA=TEST;
RUN;

/* set vs. merge */

data one;
  input 
fname $ age salary;
cards;
Bruce 30  .
Dan   40 25000
David .  .
Nadi  .  45000
;
run;

data two;
input fname $ salary;
cards;
Bruce 25000
David 35000

;
run;
data three;
  set one two;
run;
proc print data=three; run;
proc sort data=one;
  by fname;
proc sort data=two;
  by fname;

data three;
  merge one two;
  by fname;
run;
proc print data=three;
run;
