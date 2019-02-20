
/*INPUT; OUTPUT*/
/*Using OUTPUT without arguments causes the current observation
to be written to all data sets that are named in the DATA statement.*/

data distance_2;
 do miles = 1 to 20; 
   kilometers = miles *1.61;
   output;
 end;
run;
proc print data = distance_2;
run;


/* input -listinput: we need to use $  after any charactre*/
/*if we don't put ; in a seperated line after the list, we will get error*/
/* we need to use the same number of data in the data list*/
/*extra value in the list, does not go to the next line*/
/*statement of data can not be*/

data demo_;
input lname$ fname$ weight;
datalines;
;
weight_1 = weight*0.3;
run;

/*the correct way is using set*/
data demo_;
input lname $ fname $ weight;
datalines;
fate kar 21
;
run;

data demo_2;
set demo_;
weight_1 = weight*0.3;
run;

proc print data = demo_2;
run;

/****list input**/
/*lenght vs informat: we don't need "." for length */
data demo_10;
informat id $3. gender $1. dob mmddyy8.;
input id gender dob;
datalines;
;
run;
proc print data = demo_10;
format dob empdate date8.;
run;

proc print data = demo_10;
format dob empdate date9.;
run;

/*column wise input-- infact it is position*/
data demo_11;

input id $1-3
name $ 5-19 /*space is also a char*/
age 21-22
gender $ 24;
datalines;
001 alex mark  30  M
;
run;

/*input-formatted input-- we use @ to show from where to where*/
data demo_12; 
input   @1  id  $3.
      @4 name $4.
	  @8 age 2. /*it is not a character numeric with 2 number*/
      @10 gender $1.;
	  datalines;
	  001AlexMark10M
	  ;
run;

/* reading from a csv file
dlm = ',' means deliminators is commo seperated file
firstobs = 2 meaning starting from second row*/
data MINE;
infile 'C:\Users\mfatemeh\Desktop\Book1.csv' dlm = ',' firstobs=1;
input Id  $ Sex  $ paid $;
run;

proc print data= MINE;
run;

/*it also works with the double quote*/
data zhu_file;
infile "\\file1\LabShare\DSA 04-Feb-2019\SAS\participant1.csv" dlm = ',' firstobs=2;
input id $ sex $ paid $;
run;
proc print data= zhu_file;
run;

/*so far it was using data not procedure and nothing done now proc
dbms = database managment system
been REPLACING A SAS FILE INTO ANOTHER FILE*/
proc import datafile = "\\file1\LabShare\DSA 04-Feb-2019\SAS\participant1.csv" out = work.participant_test3 dbms = csv replace;
GUESSINGROWS =100;
GETNAMES = YES;
RUN;
