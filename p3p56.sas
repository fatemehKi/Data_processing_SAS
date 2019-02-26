libname p1pg56 "C:\test";

data p1pg56.prob1; 
infile 'C:\Users\mfatemeh\Desktop\participant.txt' DLM= ',' Firstobs=2;
informat id $8. date_en mmddyy8. dob mmddyy8. sex $1.;
input id $ date_en dob sex $ paid;
run;

/*nodupkey word removes all duplicates*/

/*to delete a record of observation we can refering to the observation number by _N_ */
/* data north form page 8*/
data n1
set north; 
if _N_ = 3 then delete;
