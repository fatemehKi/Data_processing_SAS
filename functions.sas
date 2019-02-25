/*the permanent libraries can be used in other new editor */

	/*compile function removes the blank*/
	/*all variables in the data step is saved in the data set for printing*/
 /*aubstr is working only on characters*/
data test1;
first_name = '    ste';
last_name = 'good   ';
first_name_1 = left(first_name);
last_name_2 = right(last_name);
run;

proc print data = test1;
run;

data ts;
address_1="2000 eg av. miisi l45";
address_2="2000, eg av. missi, 145";
num_1 = scan(address_2, 2, ',');
run;
proc print data = ts;
run;

data ts_2;
full_name = 'Fatemeh Kiaie';
new_name = trim(scan(full_name,2)) || ',' || trim(scan(full_name,1));
new_name_2 = scan(full_name,2) || ',' || scan(full_name,1);
run;
proc print data = ts_2;
run;

data ts_3;
myage = (today() - '06Sep1982'D)/365.25;
myage2 = (today() - mdy(9,6,1982))/365.25;
run;
proc print data = ts_3;
run;

data ts_4;
tod=weekday(today());
run;
proc print data = ts_4;
run;
