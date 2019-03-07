setwd('R Studio/PD Logistic Regression Project')
ad_data = read.csv('advertising.csv',header=TRUE)
fix(ad_data)
head(ad_data,1)

summary(ad_data)

# Some plots to explore the data
attach(ad_data)
hist(Age,breaks = 30)

library(WVPlots)
ScatterHist(ad_data,'Age','Area.Income', title = 'Age vs Area Income')

ScatterHist(ad_data,'Age','Daily.Time.Spent.on.Site', title = 'Age vs Dialy Time Spent on Site')

ScatterHist(ad_data,'Daily.Time.Spent.on.Site','Daily.Internet.Usage', title = 'Dialy Time Spent on Site vs Daily Internet Usage')

names(ad_data)
ad_data2 = ad_data[,-which(names(ad_data)=="Ad.Topic.Line" | names(ad_data)=="City" | names(ad_data)=="Country" | names(ad_data)=="Timestamp")]
pairs(ad_data2)

logmodel = glm(Clicked.on.Ad~Daily.Time.Spent.on.Site+Age+Area.Income+Daily.Internet.Usage+Male,data=ad_data,family = binomial)
summary(logmodel)
