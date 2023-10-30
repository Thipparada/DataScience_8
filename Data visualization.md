---
title: "Data Visualization"
author: "Thipparada"
date: "2023-09-21"
output:
  html_document: default
  pdf_document: default
---

### Instruction

This report provides an analysis of the mtcars dataset in R. It consists of five sections of data visualization and interpretation, as follows: 

1. Overview of miles per gallon (mpg) in the mtcars dataset 

2. Effect of engine displacement on fuel consumption 

3. Relationship between horsepower and mpg, segmented by automatic transmission 

4. Relation between quarter mile time in seconds and mpg, segmented by automatic transmission 

5. Relation between curb weight of the car and mpg, segmented by automatic transmission

### Overview of miles per gallon (mpg) in the mtcars dataset
The distribution of miles per gallon (mpg) in the mtcars dataset is right-skewed, with a median of 19.2 mpg. This indicates that most cars in the dataset have an mpg below 19.2 mpg.

```{r, fig.width = 5, fig.height = 3, fig.align = "center"}
library(ggplot2)
library(tidyverse)

base <- ggplot(data = mtcars,
                mapping = aes(x = mpg)) 
base +
  geom_density(fill = "#918F8E")+
  theme_bw(base_size=11) +  
  theme(plot.title = element_text(hjust = 0.5))+
  labs(
    x = "Miles per gallon",
    y = "Density",
  ) +
  scale_x_continuous(expand = c(0, 0), limits = c(10,35),breaks = seq(10, 35, 5), labels = seq(10, 35, 5)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0,0.07),breaks = seq(0, 0.07, 0.01), labels = seq(0, 0.07, 0.01))


median(mtcars$mpg)

```

### Effect of engine displacement on mile per gallon
Data visualization reveals negative correlation between engine displacement and mpg implying to fuel efficiency of cars. Therefore, to increase fuel efficiency, a reduction in engine size is necessary.
```{r, fig.width = 5, fig.height = 3, fig.align = "center"}
base2 <- ggplot(data = mtcars, 
               mapping = aes(x=mpg, y= disp))

base2 + 
  geom_point(size = 1, col = "black", alpha= 0.5)+
  geom_smooth(color = "black", se = TRUE, fill = "#90ccc6")+
  theme_bw(base_size=11) +  
  theme(plot.title = element_text(hjust = 0.5))+
  labs(
    x = "Miles per gallon",
    y = "Engine displacement in cubic inches",
  ) +
  scale_x_continuous(expand = c(0, 0), limits = c(10,35),breaks = seq(10, 35, 5), labels = seq(10, 35, 5)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0,500),breaks = seq(0, 500, 100), labels= seq(0, 500, 100))
```

### Relationship between horsepower and mpg, segmented by automatic transmission
The scatter plot shows negative correlation between horsepower and mpg, indicating that an increase in horsepower is associated with a decrease in mpg. Additionally, when considering the automatic transmission of cars, automatic cars have better mpg performance at the same horsepower.
```{r, fig.width = 5, fig.height = 3, fig.align = "center"}
mtcars$am <- factor(mtcars$am, levels=c(0,1), labels=c("Manual", "Auto"))
base3 <- ggplot(data = mtcars, 
                mapping =  aes(x=hp, y= mpg, col= am))
base3+ 
  geom_point()+
  theme_bw(base_size=11) +  
  theme(plot.title = element_text(hjust = 0.5))+
  labs(
    x = "Horsepower",
    y = "Miles per gallon",
  ) +
  scale_y_continuous(expand = c(0, 0), limits = c(10,35),breaks = seq(10, 35, 5), labels = seq(10, 35, 5)) +
  scale_x_continuous(expand = c(0, 0), limits = c(0,400),breaks = seq(0, 400, 100), labels= seq(0, 400, 100))
```

### Relationship between quarter mile time in seconds and mpg, segmented by automatic transmission
Quarter-mile time in seconds refers to the time it takes a car to accelerate from a standing start to a quarter mile. The graph does not show a clear correlation between quarter-mile time and fuel efficiency (mpg). However, when comparing automatic and manual cars, it demonstrates that automatic cars generally have better mpg performance at the same quarter-mile time.
```{r, fig.width = 5, fig.height = 3, fig.align = "center"}
base4 <- ggplot(data = mtcars, 
                mapping =  aes(x = mpg, y= qsec, col =am ))
base4+ 
  geom_point(size = 1)+
  theme_bw(base_size=11) +  
  theme(plot.title = element_text(hjust = 0.5))+
  labs(
    x = "Miles per gallon",
    y = "Quarter mile time in seconds",
  ) +
  scale_y_continuous(expand = c(0, 0), limits = c(10,35),breaks = seq(10, 35, 5), labels = seq(10, 35, 5))
```

### Relation between curb weight of the car and mpg, segmented by automatic transmission
The graph shows negative correlation between vehicle weight in pounds and fuel efficiency in miles per gallon (mpg). This indicates that heavier vehicles tend to have lower fuel efficiency. Additionally, when comparing automatic and manual cars of the same weight, manual cars have better fuel efficiency.

```{r, fig.width = 5, fig.height = 3, fig.align = "center"}
base5 <- ggplot(data = mtcars, 
                mapping =  aes(x=wt, y= mpg, col= am))
base5+ 
  geom_point()+
  theme_bw(base_size=11) +  
  theme(plot.title = element_text(hjust = 0.5))+
  labs(
    x = "Weight in pounds",
    y = "Miles per gallon",
  ) +
  scale_y_continuous(expand = c(0, 0), limits = c(10,35),breaks = seq(10, 35, 5), labels = seq(10, 35, 5)) +
  scale_x_continuous(expand = c(0, 0), limits = c(0,6),breaks = seq(0, 6, 0.5), labels = seq(0, 6, 0.5))
```
