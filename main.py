import cx_Oracle
connection = cx_Oracle.connect("system", "pass", "172.17.0.1:51521/XE")
print("Database version:", connection.version)
