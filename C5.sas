data conditional;
  input 
  @1 age 
  @4 gender $1. 
  @6 midterm 
  @9 quiz $2. 
  @11 finalexm;
datalines;
21 M 80 B- 82
.  F 90 A  93
35 M 87 B+ 85
48 F .     76
59 F 95 A+ 97
15 M 88    93
67 F 97 A  91
.  M 62 F  67
35 F 77 C- 77
49 M 59 C  81
;
run;

proc print data=conditional;
  var age gender midterm quiz finalexm;
run;

data conditional_2;
  set conditional;
       if quiz in ('A+', 'A ','B+','B ') then score_range=1;
  else if quiz in ('B-', 'C ','C-'     ) then score_range=2;
  else if not missing(quiz)              then score_range=3;
  else                                        score_range=.;
run;
proc freq data=conditional_2;
  table score_range/list;
run; 

data oldcars;
  input make $ 1-13 model $ 15-29 yearmade seats m_paid;
cards;
DeDion	      LaMarquise      1884 4 4.6
Rolls-Royce   Silver Ghost    1912 4 1.7
Mercedes-Benz SSK             1929 2 7.4
              F-88            1954 . 3.2
Ferrari       250 Testa Rossa 1957 2 16.3
;
run;
proc print data=oldcars noobs;
  title 'Old car sold at Auction';
run;
title ' ';
proc print data=oldcars ;
  where make like 'De%';
run;

proc print data=conditional;
  var age gender midterm quiz finalexm;
  where age between 20 and 60 ;
run;

data firstdata;
 input id $ age sex $ paid x1-x5;
 cards;
 001 28 M 108.46 1 2 3 4 5
 002 45 F 239.5  6 7 8 9 10
 005 38 M 321.56 1 2 3 4 5
 003 33 F 562.33 6 7 8 9 10
 004 50 M 014.64 1 2 3 4 5
 006 61 . 119.43 6 7 8 9 10
 ;
 run;

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


