lab2<-read.csv("lab2.csv",header = TRUE)

install.packages("tidyverse")
library("tidyverse")

lab2_tidy<-lab2%>%
  gather(`base_sport`, `base_pain`, `base_qol`,`first_sport`,`first_pain`,`first_qol`,`second_sport`,`second_pain`,`second_qol`,key = "type", value = "score")%>%
  separate(type, into = c("year", "category"), sep = "_")%>%
  arrange(patient_id)
lab2_tidy

lab2_tidy%>%
  group_by(year,category)%>%
  summarise(mean=mean(score),sd=sd(score))->summary1



summary1%>%
  ggplot(aes(x=year,y=mean,color=category,group=category))+
  geom_errorbar(aes(min=mean-sd,max=mean+sd),width=0.05,position=position_dodge(0.1))+
  geom_line(position=position_dodge(0.1))+
  geom_point(position=position_dodge(0.1))+
  ylim(c(0,100))

