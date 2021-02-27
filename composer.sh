composer -host twsglprod -port 1234 -protocol https

l s WKSTN00001#SCHD00001
list sched=WKSTN00001#SCHD00001 (jobstream, js, schedule)

d s WKSTN00001#SCHD00001
display sched=WKSTN00001#SCHD00001

cr C:/Users/tutor/Desktop/file_01.txt js=WKSTN00001#SCHD00001
create C:/Users/tutor/Desktop/file_01.txt from sched=WKSTN00001#SCHD00001

l j WKSTN00001#JB00001
list jobs=WKSTN00001#JB00001 (job,j,jd, jobdefinition)

d j WKSTN00001#JB00001
display jobs=WKSTN00001#JB00001

cr C:/Users/tutor/Desktop/file_01.txt j=WKSTN00001#JB00001
create C:/Users/tutor/Desktop/file_01.txt from jobs=WKSTN00001#JB00001

l r WKSTN00100#RSRC0001
list resources=WKSTN00100#RSRC0001

d r WKSTN00100#RSRC0001
display resources=WKSTN00100#RSRC0001

cr C:/Users/tutor/Desktop/file_01.txt r=WKSTN00100#RSRC0001
create C:/Users/tutor/Desktop/file_01.txt from resources=WKSTN00100#RSRC0001

val file_name.txt
validate file_name.txt

add file_name.txt

replace file_name.txt
