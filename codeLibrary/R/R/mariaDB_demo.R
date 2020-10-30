# Load the DBI package
install.packages("DBI")
library(DBI)


#resources
#https://db.rstudio.com/dbi/
#https://www.youtube.com/watch?v=9OSB9pmlJpI


#output$tbl <- renderTable({
  conn <- dbConnect(
    drv = RMySQL::MySQL(),
    dbname = "ext_ind_data_R",
    host = "isueoip1mdb.cxpaoq5bnjvw.us-east-1.rds.amazonaws.com",
    username = "studentTeam",
    port = 3306,
    password = "extensionIP18!")
  

  #List the tables in the database
    dbListTables(conn)
   
    
    #Read the data in a table
    myTable <- dbReadTable(conn, "testTable_colorNumName" ) 
    
    
  on.exit(dbDisconnect(conn), add = TRUE)
  sql <- "SELECT * FROM testTable"
  query <- sqlInterpolate(conn, sql)
  dbGetQuery(conn, query)
  

  
  #})

#dbClearResult(res)

dbDisconnect(conn)

# 
# con <- dbConnect(RSQLite::SQLite(), dbname = ":memory:")
# 
# dbListTables(con)
# dbWriteTable(con, "mtcars", mtcars)
# dbListTables(con)
# 
# dbListFields(con, "mtcars")
# dbReadTable(con, "mtcars")
# 
# # You can fetch all results:
# res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
# dbFetch(res)
# dbClearResult(res)
# 
# # Or a chunk at a time
# res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
# while(!dbHasCompleted(res)){
#   chunk <- dbFetch(res, n = 5)
#   print(nrow(chunk))
# }
# dbClearResult(res)
# 
# dbDisconnect(con)