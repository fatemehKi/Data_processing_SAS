/*proc univariate showing the  data description and statistic results, percentile.. 
only for numeric variables */
/*proc summary can sum by grouping.. 
_type_ = 0 shows the total in the grouping proc
_type_=1 showing the devision based on one grouping type (e.g. gender)
/*proc means and proc summary use class for grouping*/
/*proc freq is used for the character*/
/*finding the missing using the proc freq*/

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

/* proc means only work on the numeric variables
using class we can select the one that we are looking for the mean of*/
proc means data = test;
var age income; /* the variable that we are looking for the means of */
run;

/*if we want to find the menas for difernt group mentioned in the class and the values are maximum in 2 deciaml*/
proc means data = test maxdec=2;
var income;
class gender age;
run;
/*proc format is used to have the groups*/
/* we want to find means while grouping by differnt range in gender and age*/
proc format;
value $gender 'M'='Male'
              'F' = 'Female';
value agegrp   0 -19 = '<20 yrs '
               20 -64 ='20-64yrs'
			   65 - hight = '>=65yrs';
run;

proc means data = test maxdec=2;
var income;
class gender age;
format gender $gender. age agegrp.;
run;

/*after running proc summary we get a new table type in the working library
and if we don't select the class it shows _type_= 0 which is everything*/
proc summary data=test;
var age income;
output out=sumdata;
run;

proc summary data=test;
var age income;
class gender age;
output out=sumdata;
run;

/* we */
proc univariate data = test;
var age income;
run;
