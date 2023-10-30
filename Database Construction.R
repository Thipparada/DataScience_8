restaurant <- dbConnect(PostgreSQL(),host = "arjuna.db.elephantsql.com",
                 port = 5432,
                 user = "iaknooxs",
                 password= "3H2Iinx-0KRBtcbYiCO9pd1ESHpbCBv7",
                 dbname = "iaknooxs")

pizza_name <- c('pepperoni','cheese','sausage','mushroom','veggie','hawaiian')
price <- c(8.99,7.99,9.99,9.49,9.99,10.49)
pizza_menu <- data.frame(pizza_name,price)

dbWriteTable(restaurant,"pizza_menu",pizza_menu)

customers <- data.frame(id = 1:7, name = c("John","Mary","William","Peter","Susan","David","Jane"), country = c("New York","Los Angeles","Chicago","Houston","Phoenix","Houston","New York"))

dbWriteTable(restaurant,"customers",customers)

staffs <- data.frame(id = 1:5, name = c("John","Jane","Bill","David","Susan"), country = c("San Francisco","San Jose","Oakland","Berkeley","San Rafael"))

dbWriteTable(restaurant,"staffs",staffs)

dbListTables(restaurant)

## close connection
dbDisconnect(con)
