# oracle_bare_minimum

bare minimum to get cx_Oracle up and running inside python container

add instant client bascic from: https://www.oracle.com/pl/database/technologies/instant-client/linux-x86-64-downloads.html
https://download.oracle.com/otn_software/linux/instantclient/19800/instantclient-basic-linux.x64-19.8.0.0.0dbru.zip
to ./lib/instantclient_19_8

or uncoment auto download in dockerfile

for other version remember to change paths and link libraries if neccesary (as in commented 11_2 in dockerfile)

