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


data mine;
input ID l_date s1 s2 s3;
informat l_date mmddyy10.;
CARDS;
1 123099 75 65 85
2 123098 85 45 75
;
/*avg_score = mean(s1,s2,s3);*/
run;
