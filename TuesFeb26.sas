/*lecture on Tuesday*/

data ctoF1_2;
c =1;
do until(c>50);
F = round(9/5*c+32, 0.1); /*0.1 meaning that we need only one decimal*/
output;
c+2;
end;
run;

/***the undefined variables are assumed to be 0***/
/* the c= c+a; equals c+a*/
/*we also can calculate the summation using proc print
proc print data=something
var a b;
sum...;
run;
*/
