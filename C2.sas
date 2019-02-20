PROC IMPORT DATAFILE="E:\SAS_F\book1.CSV"
OUT = WORK.book
DBMS=CSV
REPLACE;
GETNAMES=YES;
RUN;
data book2(drop=id);
  length fname $10 lname $25 email $30;
  set book;
  sid=put(id,8.);
  label sid='student id'
        fname='First Name'
		lname='Last Name'
		acode='Area Code'
		email='Email Address'
		;
run;
proc print noobs label;
run;

data C2_P3;
  length c_id $10 fname $25 lname $20 gender $1 e_status $1 h_phone $10;
  informat dob mmddyy6.;
  input c_id fname lname dob gender e_status income n_family h_phone;
cards;
0001 Even Yin 022962 M 0 1500.00 3 416-4985870
;
run;

data distance_2;
   do miles = 1 to 20; 
      kilometers= miles * 1.61;
      /* output; */
   end;
run;
proc print data=distance_2;
run;

DATA PARTICIPANT; 
 INFILE "\\file1\LabShare\DSA 04-Feb-2019\SAS\Participant1.csv" 
        DLM= ',' FIRSTOBS=2;
 INPUT ID $ SEX $ PAID $;
RUN;

PROC IMPORT DATAFILE="E:\SAS_F\Participant1.csv"
OUT = WORK.PARTICIPANT_TEST DBMS=CSV
REPLACE;
GUESSINGROWS= 100;	
GETNAMES=YES;
RUN;

Data demo_5;
	input id $ height weight gender $ age;
Datalines;
001 68 144 M 23
002 78 202 M 34
003 62 99  F 37
003 62 100 F 37
004 61 101 F 45
;

Run;
Data demo_6;
  set demo_5;
    Wight_1=weight*0.45;
	label gender='SEX';
run;

proc print data=demo_5 label;
  label gender='SEX';
run;

proc contents data=demo_5;
run;

proc print data=demo_6;
  title "Distribution";
run;

proc print data=demo_5;
  title ' ';
run;

Proc sort data=demo_5;
	By id descending weight;
Run;
Proc sort data=demo_5 out=new nodupkey;
	By id ;
Run;






  

  
