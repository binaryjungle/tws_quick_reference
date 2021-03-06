SCHEDULE WKSTN00001#SCHD00001 VALIDFROM 01/31/2020
ON RUNCYCLE RULE1 "FREQ=DAILY;INTERVAL=1"
ON RUNCYCLE RULE2 "FREQ=WEEKLY;INTERVAL=1;BYDAY=SU"
ON RUNCYCLE RULE3 "FREQ=MONTHLY;INTERVAL=1;BYMONTHDAY=5"
ON RUNCYCLE RULE4 01/31/2020
AT 0730
(AT 0730 +1 DAYS)
(AT 0730 UNTIL 2330 +5 DAYS ONUNTIL CANC EVERY 0100 EVERYENDTIME 2300) /*V9.3*/
AT 0730 UNTIL 2330 +5 DAYS ONUNTIL CANC /*Will be auto cancelled after 5 days at 2330*/
PRIORITY 10
CARRYFORWARD /*Will be carried to next days plan on failures*/
LIMIT 5 /*5 jobs will run in parallel in this shedule*/
FOLLOWS WKSTN00001#SCHD00009.JB00009 /*Waits for this dependent job ONLY*/
FOLLOWS WKSTN00001#SCHD00008.@ /*Waits for FULL schedule to complete running*/
:

WKSTN00001#JB00001 /*Minimum information. No dependency*/

WKSTN00001#JB00002 /*File dependency*/
 OPENS WKSTN00001#"/home/tutor/trigger_01.DONE" (`ls %p | wc -w` -ge 1)
 OPENS WKSTN00001#"/home/tutor/trigger_01.DONE,/home/tutor/trigger_02.DONE" (`ls %p | wc -w` -ge 1)

WKSTN00001#JB00003 /*Priority & Job Dependency*/
 PRIORITY 10
 FOLLOWS JB00002
 FOLLOWS WKSTN00002#SCHD00002.JB00002
 FOLLOWS WKSTN00003#SCHD00003.JB00003 PREVIOUS

WKSTN00001#JB00004 /*Cyclic Jobs*/
 EVERY 0015 UNTIL 0600 ONUNTIL CANC

WKSTN00001#JB00005 /*Resource constraints*/
 NEEDS 1 WKSTN00100#RSRC0001

END