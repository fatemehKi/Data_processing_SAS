/*printing just some columns in and changing te name of column */
proc print data = demo_1;
var id gender dob;
label dob = 'date of birth';
run;

/*if we use the same data name we overwrite*/
data demo_;
input lname $ fname $ weight;
datalines;
fate kar 21
;
run;

data demo_;
set demo_;
weight_1 = weight*0.3;
run;

/*perman change vs the print change*/

/*permanent change.... check code*/
data= demo_6;
set demo_;
weight_1 = weight*0.3;
label gender = 'SEX';
run;

proc print data= demo_6 label;
set demo_;
weight_1 = weight*0.3;
label gender = 'SEX';
run;

/* printing by 2 will not work if we dont use proc sort*/
data demo_1;
input id gender$;
/*cards;*/
datalines;
1 30 M
1 2 F
;
run;
/*1*/

proc sort data = demo_1;
by gender;
run;

/*2*/
proc print data=demo_1;
var id, age;
by gender;
run;

/* to add/remove title*/
proc print data=demo_1;
title " dr";
run;

proc print data=demo_1;
title " ";
run;
/*if we have the same ids we can sort by id and doing descending or ascending to keep the top one */
proc sort data=demo_1;
by id;
run;

proc sort data=demo_5;
by id weight descending;
run;

/*common key is used to merge two fles*/
 
