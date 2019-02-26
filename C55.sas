data grades;
  input id section score @@;
  
  if score ge 90 then grade = "A";
    else if score ge 80 then grade = "B";
           else if score ge 70 then grade = "C";
                  else if grade ge 60 then grade = "D";
                         else if score ne . then grade = "F";

  select;
    when (score ge 93) plusminus = "A ";
    when (score ge 90) plusminus = "A-";
    when (score ge 88) plusminus = "B+";
    when (score ge 83) plusminus = "B ";
    when (score ge 80) plusminus = "B-";
    when (score ge 78) plusminus = "C+";
    when (score ge 73) plusminus = "C ";
    when (score ge 70) plusminus = "C-";
    when (score ge 68) plusminus = "D+";
    when (score ge 63) plusminus = "D";
    when (score ge 60) plusminus = "D-";
    when (score ne . ) plusminus = "F ";
    otherwise;
  end;
  label id        = "Student ID number"
        section   = "Class section number"
        score     = "Exam score"
        grade     = "Traditional grade"
        plusminus = "Plus/Minus grade"
        ;
datalines;
811 1 85 138 1 95 137 1 75 642 1 94 134 1 88 466 1 84 258 1 36 733 1 86 844 1 69
131 2 84 336 2 76 541 2 79 951 2 79 348 2 94 846 2 64 187 2 96 976 2 68 199 2 46
879 3 54 796 3 97 872 3 94 647 3 99 994 3 46 884 3 86 946 3 76 465 3 79 944 3 84
;
RUN;

proc sort data=grades;
  by section plusminus;

proc print data=grades;
  by section;
  id section;
run;

proc freq data=grades;
  table grade/missing list;
  table plusminus/missing list;
  table grade*plusminus/missing list;
run;

/******* Topic Function **********/
data one;
 input x1-x4;
 cards;
 1 2 3 4 
 13.75 . 5 7
 0.5 . . 8
 ;
run;
/* if we miss one argument '.' we can don't have total1 but total2 and total3 are exsist*/
data sums;
 set one;
 total1 = x1 + x2 + x3 + x4;
 total2 = sum(of x1-x4);
 total3 = sum(x1, x2, x3, x4);
run;

proc print data = sums;
run;

data means;
 set one;
 mean1 = (x1+x2+x3+x4)/4;
 mean2 = mean(of x1-x4);
 mean3 = mean(x1, x2, x3, x4);
run;

proc print data = means;
run;

data rounds;
 set one;
 round1 = round(x1);
 round2 = round(x1,1);
 round3 = round(x1,0.1);
 round4 = round(x1,0.01);
 int = int(x1);
run;

proc print data = rounds;
run;
/****
MAX returns the largest of the argument values 

MIN returns the smallest of the argument values 

SQRT calculates square root of the argument value 

ROUND rounds value to the nearest indicated round-off unit 

LOG gives the natural log of the argument 

MEAN returns the mean of the nonmissing argument values 

SUM returns the sum of the nonmissing argument values 

STD returns the standard deviation of the nonmissing values 

DATE gives the current date as a SAS date value 
********/

/******* Topic Sum ***********/
data one; 
 input x y z; 
 cards; 
 1 3 5 
 4 2 7 
 8 6 5 
 8 . 9 
 5 6 6 
 ; 
run;
data x_sum;  
   set one end = last; 
    xsum + x; 
	happy + y;
	myzsum + z;
   if last = 1 then output; 
   drop x y z ; 
 run;

proc print data = x_sum; 
run;  

/******** Topic - Retain ***********/
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

/******* Substr **************/

data one;
 length y $ 23;
 y = "Thank you for your help";
 subt = substr(y,1,5);
 suby = substr(y,7,3);
run;

proc print;
run;

