library(nycflights13)

##review data frame structure
glimpse(flights)

##filter data
flights %>%
  group_by(month) %>%
  summarise(n=n())

flights %>%
  count(month)

## FEB 2023, carrier most flights?
flights %>%
  filter(month ==2) %>%
  count(carrier) %>%
  arrange(-n) %>%
  head(5) %>%
  left_join(airlines, by= "carrier")
  
## What is the longest flight in terms of distance?

flights %>%
  select(origin,dest,distance,carrier) %>%
  arrange(-distance) %>%
  head(5) %>%
  left_join(airlines, by= "carrier")

## What is the longest flight in terms of distance?
flights %>%
  select(origin,dest,dep_time,carrier) %>%
  arrange(-dep_time) %>%
  head(5) %>%
  left_join(airlines, by= "carrier")

## What are the top 10 most delayed flights in the dataset?
flights %>%
  select(flight,arr_delay,carrier) %>%
  arrange(-arr_delay) %>%
  head(10) %>%
  left_join(airlines, by= "carrier")

## Which carrier has the most flights in each month?
for(i  in 1:12){
print(paste("month",i))
  top_carriers <- flights %>%
  filter(month == i) %>%
  count(carrier) %>%
  arrange(-n) %>%
  head(1) %>%
  left_join(airlines, by= "carrier")
  top_carriers <- top_carriers %>%
  left_join(airlines, by = "carrier")
print(top_carriers)}

## Where are the most popular destination
flights %>%
  count(dest) %>%
  arrange(-n) %>%
  head(5)
