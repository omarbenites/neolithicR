# load libraries
library(RSQLite)

# connect to database and load the content of the table "dates" into a dataframe datestable
con <- dbConnect(RSQLite::SQLite(), "data/rc.db")
datestable = dbGetQuery(con, 'select * from dates')

# remove dates without long and lat value
datestable <- datestable[!is.na(datestable$LONGITUDE),]
datestable  <- datestable[!is.na(datestable$LATITUDE),]

# store data.frame datestable as a .RData object into the app file system
save(datestable, file = "modules/radiocarbon5/data/c14data.RData")

# test
# load(file = "modules/radiocarbon3/data/c14data.RData")