data table;
  do n=1 to 10;
    square=n*n;
	squareroot=sqrt(n);
  output;
  end;
run;
proc print data=table; run;
title ' ';
data CtoF1;
  do c=1 to 50 by 5;
  F=round(9/5*c+32,0.1);
  output;
  end;
run;

proc print data=CtoF1;
run;

data CtoF4;
  do c=50 to -50 by -2;
  F=round(9/5*c+32,0.1);
  output;
  end;
run;

proc print data=CtoF4;
run;

data CtoF6;
  C=1;
  do while(C<=50);
  F=round((9/5*c+32),0.1);
  output;
  C=C+2;
  end;
run;

proc print data=CtoF6;
run;

data CtoF7;
  C=1;
  do until(C>50);
  F=round((9/5*c+32),0.1);
  output;
  C+2;
  end;
run;

proc print data=CtoF7;
run;

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

data walkers;
  input entry agegroup $ times @@;
datalines;
54 youth 35.5 21 adult 21.6 6 adult 25.8 13 senior 29.0
38 senior 40.3 19 youth 39.6 3 adult 19.0 25 youth 47.3
;
run;
proc print data=walkers; run;

proc sort data=walkers;
  by times;
run;
data order;
  set walkers;
  place=_N_;
run;

proc print data=order; run;
proc sort data=order;
  by agegroup place;
run;
data order1;
  set order;
  by agegroup;
  if first.agegroup; 
run;
  /*then
    do;
	group_place='First Place';
	end; 
   else if last.agegroup then
    do;
	group_place='Last Place';
	end; */
run;
proc print data=order1; 
  title 'Result of Walk';
run;

data electric;
  set sashelp.electric;
run;
proc sort data=electric;
  by customer;
run;
data count;
  set electric;
  by customer;
  retain count;
  if first.customer then count=0;
  count=count+1;
run;
data count;
  set electric;
  retain count;
  if _N_=1 then count=0;
  count=count+1;
run;

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
6 5 4 2 8 9 3
;
run;
proc print data=array_style;
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
6 5 4 2 8 9 3
;
run;
proc print data=array_style;
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
6 5 4 2 8 9 3
;
run;
proc print data=array_style;
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

/*HOMEWORK*/
 data participant;
   infile 'C:\SAS_F\participant.txt' dlm=',' firstobs=2;
   length id $8 date_en 8 dob 8 sex $1 ;
   informat date_en dob mmddyy8.;
   input id date_en dob sex paid;
run;

proc print data=participant;
  format date_en dob date7.;
run;

proc sort data=participant out=participant1;
  by id;
run;

data participant2;
  set participant1;
  by id;
    if first.id then freq=0;
    freq+1;
  if last.id;
run;

proc sort data=participant2 out=participant3 nodupkey;
  by id;
run;



data participant2;
  set participant1;
   freq=_N_;
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
data quest;
  input cust_id $ (A1 - A5) ($1. +1);
cards;
001 A D C A B
002 b A C A D
003 C C D F B
004 B a c e w
;
run;

data check_a;
  set quest;
  array A A1 - A5;
  invalid_num=0;
    do i=1 to 5;
	   A(i)=upcase(A(i));
	  if A(i) not in ('A','B','C','D','E') then
	     invalid_num+1;
	end;
  drop i;
run;

data C6_P3;
   do weight_kg=1 to 50;
      price=weight_kg*8.25*1000/450;
	  format price 8.2;
	  output;
   end;
run;

data c6_p4;
  input city $ 1-9 age S1 - S5;
  invalid_num=0;
  array S(5);
    do i=1 to 5;
	  if S(i)=9 then 
        do; 
           S(i)=.;
	       invalid_num=invalid_num+1;
		end;
	end;
	drop i;
datalines;
Albany   54 3 9 4 4 9
Richmond 33 2 9 3 3 3
Okland   27 3 9 4 2 3
;
run;

proc print data=c6_p4;
run;












