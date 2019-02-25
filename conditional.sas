/*conditioanal*/
/*wher is more efficient from processor pov compare to if*/
/*rather than using if s.th = case1 ors.th =  case 2,.. then .. better to use if s.th in (case1, case2,..) then...*/

/*the format of the spacing in below need to be followed*/
data oldcars_1;
input make $ 1-13 model $ 15-29 yearmade seats m_paid;
cards;
DeDion         LaMarquise     1884 4 4.6
crv_touring    hyunda         2016 4 24.6
Mercedes-Benz  SSK            1929 2 7.4
               F-88           1954 . 3.2
Ferrari        250 Testa Rose 1957 2 16.3
;
run;
proc print data = oldcars_1 noobs;
run;

proc print data = oldcars_1;
where make like 'De%';
run;

proc print data = oldcars_1;
where yearmade <= 1954;
run;

data purpose_;
set oldcars_1;
if seats = 4 then purpose = 'family';
/* make sure that you have the same spacing for the titles.. */
else if seats = 2 then purpose = 'single';
/*otwo approachs for the else..*/
/*else if missing(seats) then purpose = 'NA';
rather than NA you can have ' ' space itself*/
else  purpose = 'NA';
run;
proc print data = purpose_;
run;

/* make sure that you have the same spacing for the titles.. otherwise not showing */
data purpose_;
set oldcars_1;
     if seats = 4 then purpose = 'family           ';
else if seats = 2 then purpose = 'single or couple ';
else                   purpose = '                 ';
run;
/*to show the frequency of each
freq itself does the print as well*/
proc freq data=purpose_;
table purpose;
run;

data firstdata;
input id $ age sex $ paid x1-x5;
cards;
001 28 M 108.46 1 2 3 4 5
002 28 F 108.46 1 2 3 4 5
001 32 M 108.46 1 2 3 4 5
;
run;
data seconddata;
set firstdata;
/*if sex = 'M' and age>27; or another approach*/
if sex = 'M'; if age>30;
run;

proc print data=seconddata;
run;

/*data _Null_ doesnot genetrate data table*/
