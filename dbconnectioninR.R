library(RMySQL)
mydb = dbConnect(MySQL(), user='root', password='admin', dbname='test', host='localhost')
# to list the tables
dbListTables(mydb)
dbListFields(mydb, 'product')
# Importing the data into R
rs = dbSendQuery(mydb, "select * from product")
dataset = fetch(rs, n=-1)
# Understanding data manipulation
df <- c()
mydb1 = dbConnect(MySQL(), user='root', password='admin', dbname='test2', host='localhost')
dbListTables(mydb1)
# dbWriteTable(mydb1, name='product', 
#              values=df)
# To insert R matrix data into the existing data table in MySQL, use the following
# command:
# defining data matrix  
datamatrix <- matrix(1:4, 2, 2)
# defining query to insert the data
query <- paste("INSERT INTO names VALUES(",datamatrix [1,1], ",",datamatrix [1,2], ")")
# command for submitting the defined SQL query dbGetQuery(con, query)
# Sometimes we need to delete a MySQL table when it is no longer of use. We can fire
# the following query to delete the mysql_some_table table:
dbSendQuery(mydb, 'drop table if exists mysql_some_table')
