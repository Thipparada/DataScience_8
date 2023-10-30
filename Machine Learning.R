library(caret)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(httr)
library(readxl)

GET("https://query.data.world/s/3wbnwjdqhvi3ixlef4t3m7wtkildjz?dws=00000", write_disk(tf <- tempfile(fileext = ".xlsx")))
data <- read_excel(tf)

## check whether there are price which = 0
check <- data %>%
  select(Price,id) %>%
  filter(Price == 0) 

## change column name
column_names <- names(data)
colnames(data)[column_names == "number of bedrooms"] <- "nbedrooms"
colnames(data)[column_names == "living area"] <- "larea"
colnames(data)[column_names == "number of floors"] <- "nfloors"
colnames(data)[column_names == "condition of the house"] <- "conofhouse"
colnames(data)[column_names == "Distance from the airport"] <- "disfromap"



## add log value of price to make data well distributed
data <- data %>%
  select_all() %>%
  mutate(price_log = log(Price),
         new_log = log(Price+1))

## check whether there are missing data
data %>%
  complete.cases() %>%
  mean()


## split data 80% train, 20% test
set.seed(42)
n <- nrow(data)
train_id <- sample(1:n, size = 0.8*n)
train_df <- data[train_id, ]
test_df <- data[-train_id, ]

## train model
set.seed(42)
lm_model <- train(price_log ~ nbedrooms +larea + nfloors + conofhouse + disfromap,
                  data = train_df,
                  method = "lm")

lm_model # 

# 3. score model
p <- predict(lm_model, newdata=test_df)

## evaluate model

# mean absolute error
(mae <- mean(abs(p - test_df$price_log)))

# root mean square error
(rmse <- sqrt(mean((p - test_df$price_log)**2)))

# optional - check variable importance
varImp(lm_model)


cat("Train Set\n",
    "mae : ", lm_model$results[[4]], "\n",
    "RMSE : ", lm_model$results[[2]], "\n",
    "\nTest Set\n",
    "mae : ", mae, "\n",
    "RMSE : ", rmse, "\n",
    "\nSum-Up : The model fits well with unseen data,",
    "\nthe different mae between predicted and actual equal to : ", (lm_model$results[[4]] - mae), "\n",
    "\nthe different RMSE between predicted and actual equal to : ", (lm_model$results[[2]] - rmse), "\n")

# Further improvements:
## Train the model using all variables.
## Find the variable importance.
## Train the model again using the significant variables.
## Compare RMSE and MAE.
