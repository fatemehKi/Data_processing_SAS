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

data _NULL;
  Address="2000 Eglinton-Ave. MissiSsauga L5J'4L0";
  New_add=compress(Address,",.-'");
  add=propcase(New_add);
run;
proc print data=_null;
run;

data ts;
Address_1="2000 Eglinton Ave. Mississauga L5J4L0";
Address_2="2000, Eglinton Ave., Mississauga, Ontario L5J4L0";
Num_1=scan(address_1,1);
Num_2=scan(address_2,1,',');
Street_name_1=scan(address_1,2);
Street_name_2=scan(address_1,2,' ');

full_name='Stephen Goodnight';
New_name=trim(scan(full_name,2)) ||','|| trim(scan(full_name,1));

Age=int((today()-'31dec65'd)/365.25);

Age1=int((today()- mdy(12,31,65))/365.25);
today_date=weekday(today());

dob='02JUN1968'd;

Years=intck('year',dob,today());
quarters=intck('qtr',dob,today());
months=intck('month',dob,today());
weeks=intck('week',dob,today());
days=intck('day',dob,today());

run;
proc print data=ts;run;



data m_participant;
length id $8 date_en 8 dob 8 sex $1;
informat date_en dob mmddyy8.;
infile 'C:\SAS_F\SAS Fundamental_Final\Teaching Materials and Handouts\Data and Scripts\participant.txt' dlm=',' firstobs=2;
input id date_en dob sex paid;
age=int((today()-dob)/365.25);
/* yr=intnx('year', '05feb94'd, 3, 'S'); */
m_day=intnx('Year', date_en, 1, 'S')-1;
m_mth=month(m_day);
b_day=intnx('year', dob, 1, 'S');
run;
proc print data=m_participant (obs=10);
  format dob b_day date9.;
run;
proc freq data=m_participant;
  table m_mth/list;
run;

data dates;
  input 
  	@1 subj $3.
	@4 dob mmddyy10.
	@14 visit date9.
	;
datalines;
00110/21/195011NOV2006
00201/02/195525MAY2005
;
run;
data dates1;
  set dates;
  age=int(yrdif(dob, visit));
  format dob visit date9.;
  run;
  proc print data=dates1; run;
options yearcutoff=1910;
  data new_date;
    input e_date mmddyy8.;
	format e_date mmddyy10.;
cards;
01/01/10
05/09/06
;
run;
proc print data=new_date; run;

data do_it;
  length id $12;
  informat e_date mmddyy8.;
  format e_date date9.; 
  input id $ e_date;
  cards;
  A001 09/12/81
  B016 10/31/78
  C482 01/28/90
  D136 05/10/95
  E385 10/10/91
  ;
run;

data redeem;
  set do_it;
  if year(e_date)<1990 then
    do;
	bpoint=1000 + 
           50*(intck('month', e_date, '31DEC1989'D)) +
		   35*(intck('month', '01JAN1990'D, '01JAN2000'D));
	end;
  else
    do;
	bpoint=500 + 
		   35*(intck('month', '01JAN1990'D, '01JAN2000'D));
	end;
       if bpoint<=1000  then r_cash=20;
  else if bpoint<=3000  then r_cash=30;
  else if bpoint<=7000  then r_cash=50;
  else if bpoint<=10000 then r_cash=80;
  else                       r_cash=100;
run;

proc freq data=redeem noprint;
  table r_cash/list out=redeem_list;
run;

data CUXPHONE;
  length CUST_ID $4 PHONE $12;
  INPUT CUST_ID $ PHONE $;
DATALINES;
A101 416-123-3211
E202 905-509-5009
K303 416-614-6411
M404 905-605-6655
Y505 416-685-5588
X606 514-415-4455
;
RUN;

DATA SAMPLE;
  SET CUXPHONE;
  IF SUBSTR(PHONE,1,3) IN ('416','905') THEN GTA='Y';
  ELSE                                       GTA='N';
RUN;
DATA SAMPLE;
  SET CUXPHONE;
  IF SUBSTR(PHONE,1,3) IN ('416','905') AND SUBSTR(CUST_ID,1,1)<='K';
RUN;
PROC print DATA=SAMPLE;
RUN;
data test1;
/*Full_name='Ar    Kar      Min';
New_name=compbl(full_name);
Address="2000 Eglinton-Ave. Mississauga L5J'4L0";
New_add=compress(address,",.-"); 

First_name='      Stephen';
Last_name='goodnight      ';
First_name_1=left(first_name);
Last_name_2=right(last_name); 

First_name='Stephen';
Last_name='goodnight';
First_name_1=lowcase(first_name);
Last_name_2=upcase(last_name); */

Last_name='goodnight';
Test_1=substr(last_name,1,3);
Test_2=substr(last_name,1,1);
Test_3=substr(last_name,1);
run;
proc print data=test1;
run;

/*

*/







  

