Examples SAS mysql interface on power workstation

Original topic: SAS 9.4 /MySQL: cannot load interface

github
https://tinyurl.com/ycgryyp5
https://github.com/rogerjdeangelis/utl_examples_SAS_mysql_interface_on_power_workstation

see
https://tinyurl.com/y9ajmblr
https://communities.sas.com/t5/Base-SAS-Programming/SAS-9-4-MuSQL-cannot-load-interface/m-p/448143

If you install mySQL using defaullt settings on your 'power' workstation.
then the example below should work.

Except for big data or big computation any modern laptop or
desktop is a power workstation when compared to
almost all EG servers?

* sakila database comes with mySQL;

*          _                       _   _
 ___  __ _| |  _ __   __ _ ___ ___| |_| |__  _ __ _   _
/ __|/ _` | | | '_ \ / _` / __/ __| __| '_ \| '__| | | |
\__ \ (_| | | | |_) | (_| \__ \__ \ |_| | | | |  | |_| |
|___/\__, |_| | .__/ \__,_|___/___/\__|_| |_|_|   \__,_|
        |_|   |_|
;

proc sql;
   connect to mysql (user=root password="xxxxxxx"
        database='sakila' /*port=3306*/);             ** you do not need port;
   create table films(index=(film_id/unique)) as select  *
     from connection to mysql
     (select * from film);
    disconnect from mysql;
quit;

NOTE: Table WORK.FILMS created, with 1000 rows and 13 columns.

50        disconnect from mysql;
51    quit;
NOTE: PROCEDURE SQL used (Total process time):
      real time           0.13 seconds
      cpu time            0.01 seconds


*_ _ _
| (_) |__  _ __   __ _ _ __ ___   ___
| | | '_ \| '_ \ / _` | '_ ` _ \ / _ \
| | | |_) | | | | (_| | | | | | |  __/
|_|_|_.__/|_| |_|\__,_|_| |_| |_|\___|

;

libname mysqllib mysql user=root password="xxxxxx" database=sakila;

proc sql;
    create table want as
    select * from mysqllib.actor;
;quit;

libname mysqllib clear;

1     libname mysqllib mysql user=root password=XXXXXXXXXX database=sakila;
NOTE: Libref MYSQLLIB was successfully assigned as follows:
      Engine:        MYSQL
      Physical Name:
2     proc sql;
3         create table want as
4         select * from mysqllib.actor;
NOTE: Table WORK.WANT created, with 200 rows and 4 columns.

5     ;quit;
NOTE: PROCEDURE SQL used (Total process time):
      real time           0.25 seconds
      cpu time            0.01 seconds


6     libname mysqllib clear;
NOTE: Libref MYSQLLIB has been deassigned.
*          _                            _
 ___  __ _| |   _____  _____  ___ _   _| |_ ___
/ __|/ _` | |  / _ \ \/ / _ \/ __| | | | __/ _ \
\__ \ (_| | | |  __/>  <  __/ (__| |_| | ||  __/
|___/\__, |_|  \___/_/\_\___|\___|\__,_|\__\___|
        |_|
;


proc sql;
   connect to mysql ( user=root password="xxxxxx" database=sakila);
   execute (drop table chad)  by mysql;
   execute (
       create
         table longstring as
       select
          country
         from
           country
         where
           country="Chad")
      by mysql;
   disconnect from mysql;
quit;
run;quit;

NOTE: PROCEDURE SQL used (Total process time):
      real time           0.30 seconds
      cpu time            0.01 seconds

