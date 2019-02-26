*to delete a record of observation we can refering to the observation number by _N_ */
/* data north form page 8*/
data mine;
input age id;
cards;
23 32
21 34
12 45
;
run;

/*removing a row*/
data n1;
set mine; 
if _N_ = 3 then delete;
run;

/*removing a column*/
data n2;
set mine(drop=age); 
run;
/*class is used for categorization*/
