data Alive;
  set sashelp.heart;
  if status='Alive';
  if Smoking>0 then Smoker='Y';
  else              Smoker='N';
run;
proc freq data=alive;
  table smoker;
run;

data train;
  input time : time5. cars people;
  format time time5. people_per_car 3.1;
  people_per_car=people/cars;
cards;
10:10 6  21
12:15 10 56
15:30 10 25
11:30 8  34
13:15 8  12
14:45 6  13
20:30 6  32
23:15 6  12
;
run;

proc print data=train noobs;
  var time people_per_car;
  title 'Average number of people per train car';
run;

data south;
  input entrance $ passnumber partysize age;
cards;
S 43 3 27
S 44 3 24
S 45 3 2
;
run;

data north;
  input entrance $ passnumber partysize age lot;
cards;
N 21 5 41 1
N 97 4 33 3
N 65 2 67 1
N 66 2 7  1
;
run;

data both_entrance;
  set south north;
       if age=.  then m_paid=.;
  else if age<3  then m_paid=0;
  else if age<65 then m_paid=35;
  else                m_paid=27;
run;

proc print data=both_entrance;
  title 'Both Entrance';
run;

proc sort data=south;
  by passnumber;
run;

proc sort data=north;
  by passnumber;
run;

data both_entrance;
  set south north;
  by passnumber;
run;

proc print data=both_entrance;
run;

/*When the TRUNCOVER option is specified in the INFILE statement, 
and when the record is shorter than what the INPUT statement expects,
SAS reads a variable length record. */

/* Match-marge case study */
	 
data company;
   input Name $ 1-25 Age 27-28 Gender $ 30 salary;
   datalines;
Vincent, Martina          34 F 60000
Phillipon, Marie-Odile    28 F 80000
Gunter, Thomas            27 M
Harbinger, Nicholas       36 M
Benito, Gisela            32 F
Rudelich, Herbert         39 M
Sirignano, Emily          12 F
Morrison, Michael         32 M
;
run;


data finance;
   input IdNumber $ 1-11 Name $ 13-40 Salary;
   datalines;
074-53-9892 Vincent, Martina             35000
776-84-5391 Phillipon, Marie-Odile       29750
929-75-0218 Gunter, Thomas               27500
446-93-2122 Harbinger, Nicholas          33900
228-88-9649 Benito, Gisela               28000
029-46-9261 Rudelich, Herbert            35000
442-21-8075 Sirignano, Emily             5000
;
run;

proc sort data=company ;
   by Name;
run;
proc sort data=finance;
   by Name;
run;

data staff_list;
  merge company finance(rename=(salary=salary1));
  by Name;
run;
proc print data=staff_list;
   title 'Personal Profile';
run;

data gender;
  input gender $ promo_rate;
cards;
M 0.05
F 0.10
;
run;

proc sort data=gender;
  by gender;
proc sort data=staff_list;
  by gender;
data new_salary;
  merge staff_list gender;
  by gender;
  new_salary=round((salary+ salary*promo_rate), 8.2);
run;

proc print data=new_salary noobs;
  format new_salary dollar9.2;
run;

data one;
  set sashelp.class;
	   training_1=_N_;
run;

data two;
  set sashelp.class;
	   training_2=_N_ -1;
run;

data three;
  set sashelp.class(firstobs=10);
	   training_3=_N_;
run;

data four;
  set sashelp.class(firstobs=15);;
	   training_4=_N_ -1;
run;

proc sort data=one;
  by name;
proc sort data=two(keep=name training_2) out=two_new;
  by name;
proc sort data=three (keep=name training_3) out=three_new;
  by name;
proc sort data=four (keep=name training_4) out=four_new;
  by name;
run;

data f_file ;
  merge one(in=a) two_new(in=b) three_new(in=c) four_new(in=d);
  by name;
       if a and b then output f_file;
run;
proc print data=f_file;
run;

data three_not4_file four_not3_file f3_f4_file left_over; 
  merge one(in=a) three_new(in=c) four_new(in=d);
  by name;
        if a and c and not d    then output three_not4_file;
   else if a and d and not c     then output four_not3_file; 
   else if a and c and d         then output f3_f4_file; 
   else if a and not d and not c then output left_over; 
run;



data ttwo;
  input id $ x y;
cards;       
097 021 12345 
123 022 01284 
098 032 0486 
123 018 1479
;
run;

PROC APPEND BASE =FF
			DATA=ttwo;
Run;

data tthree;
  input id $ x y;
cards;       
007 987 54321 
;
run;

PROC APPEND BASE =FF
			DATA=tthree;
Run;

data one;
  input id name $ age salary;
cards;
1 david 25 50000
2 corry 35 .
2 corry 35 .
3 mary  18 .
3 mary  18 .
;
run;

data two;
  input id salary;
cards;
1 80000
3 60000
;
run;

data three;
  update one two;
  by id;
run;
proc print data=three;
run;

data three;
  merge one(in=a keep=(id)) two(in=b);
  by id;
  if a ;
run;

proc print data=three;
run;







