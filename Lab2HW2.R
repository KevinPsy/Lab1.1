coverage1<-read.csv("coverage.csv",header = TRUE,skip = 2,nrows=52)
expenditures<-read.csv("expenditures.csv", header = TRUE, skip = 2,nrows = 52)

install.packages("tidyverse")
library("tidyverse")

coverage1_tidy<-coverage1%>%
  gather(indexes= 2:ncol(coverage1),key = "type", value = "expenditure")%>%
  separate(type, into = c("year", "category"), sep = "__")%>%
  arrange(year)
coverage1_tidy


expenditures_tidy<-expenditures%>%
  gather(indexes= 2:ncol(expenditures),key = "type", value = "expenditure")%>%
  separate(type, into = c("year", "category"), sep = "__")%>%
  arrange(year)
expenditures_tidy

total <- rbind(coverage1_tidy, expenditures_tidy) 
total$year <- gsub("X","",total$year)

total_2013_2016 <- subset(total,year >= 2013)

