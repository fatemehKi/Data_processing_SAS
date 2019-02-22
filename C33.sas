data test;
     input gender $ age income;
cards;
F 26 23400
F 40 45000
F 25 26800
F 38 44900
F 56 65000
M 23 38000
M 28 47250
M 60 68500
M 22 95600
M 42 42050
M 39 85230
M 25 66450
M 65 .
;
run;
proc means data=test nmiss;
  var age income;
  class gender;
 run;
proc format;
  value agegroup
        low-<26='<=25  '
		26- <36='26-35 '
		36- <46='36-45 '
		46- <56='46-55 '
		56-high='Senior'
		;
run;
proc print data=test;
  format age agegroup.;
run;
proc means data=test maxdec=2;
  var age income;
  class gender age;
  format age agegroup.;
run;
proc summary data=test;
  var age income;
  output out=sumdata;
run;
proc print data=sumdata;
run;

Proc summary data=test maxdec=2;
	var income;
	class gender age;
	format Age agegroup.;
	output out=sumdata n=number min=min
			mean=mean std=stdev sum=total;
Run;
proc print data=sumdata(where=(_Type_=1)); run;


proc univariate data=test;
  var age income;
run;

Proc univariate data=test normal plot freq;
	var income;
	output out=sumdata 
			n=n min=min
			mean=mean std=std
			median=median;
Run;


proc univariate data=test normal freq plot;
  var income;
  output out=summary_income;
run;
proc print data=summary_income;
run;

Proc freq data=test;
	table gender*age/missing list;
	/*format Age agegroup.;*/
Run;


/* P1 */
/* 25*11/100=2.75 (j+1=3 : 6) */
/* 75*11/100=8.25 (j+1=9 : 18) */
/* Answer id d */

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

data profit;
  set C3_P2;
  profit=1.25*box_num;
run;
proc sort data=profit;
  by class_num profit;
run;
proc summary data=profit noprint;
  class class_num;
  var profit;
  output out=total_profit
         sum(profit)=total_profit
		 ;        
run;
proc print data=total_profit;
  format total_profit dollar6.2;
run;

data C3_P3;
  input age sex income color $;
cards;
19 1 14000 Y
45 1 65000 G
72 2 35000 B
31 1 44000 Y
58 2 83000 W
;
run;

proc format;
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
proc print data=C3_P3;
  var age sex color;
  format age agegroup. sex genderg. color $co.;
run;

proc freq data=C3_P3 ;
  table age/ out=cs_list;
run;

data Homegarden;
  infile 'E:\SAS_F\Garden.txt';
  input name $ 1-7 Tomoto Zucchini Pears Graps;
  Zone=14;
  Type='Home';
  Zucchini=Zucchini*10;
  Total=Tomoto + Zucchini + Pears + Graps;
  Per_Tomot=(Tomoto/Total)*100;
run;
proc print data=Homegarden;
  title 'Home Garden Survey';
run;

data contest;
  infile 'E:\SAS_F\AG13.txt';
  input name $ age type $ date mmddyy10. 
        score1 score2 score3 score4 score5;

  avg_score=mean(score1,score2,score3,score4,score5);
  dayentered=day(date);
  monthentered=month(date);
  yearentered=year(date);
  type=upcase(type);
  format date date9.;
  data_new=mdy(monthentered, dayentered, yearentered);
run;
proc print data=contest;
 
  title ' ';
run;






