#Assignment Number 2,
# calling the dataset to Rstudio;
data1<-read.csv("/Users/akbarusmanov/Desktop/price_index_Feb20201.csv",header=T)
#/Users/akbarusmanov/Desktop
head(data1,n=3)#Look at a bit of Data silde in R programming source: iclass
tail(data1,n=3)
summary(data1)# getting a summary of SER_REF, TIME_REF, DATA_VAL, STATUS, UNITS, SUBJECT, GROUP, Series_title_1, Series_title_2,Series_title-3
#Mpre in depth information
str(data1)# 1203 obs of 10 variables
#quantile of quantative variables
quantile(data1$TIME_REF,na.rm=TRUE)
quantile(data1$DATA_VAL,na.rm=TRUE)
#making a table
table(data1$DATA_VAL, useNA = "no")
# checking for missing values
sum(is.na(data1$DATA_VAL))# no N/A values here
sum(is.na(data1$TIME_REF))# no N/A values here
sum(is.na(data1$STATUS))# the same no any N/A values
any(is.na(data1$DATA_VAL))# false shows if not N.A values
all(data1$Subject>0) # results shows true because of NA values
# row and column sums
colSums(is.na(data1))
all(colSums(is.na(data1))==0)
# values with specific charecteristics
table(data1$TIME_REF %in% c("2007"))
#Cross tabs
data(data1)
DF=as.data.frame(data1)
summary(DF)
#size of datasets
fakeData=rnorm(data1)
object.size(fakeData)# 176 bytes
#Sometimes the raw data won’t have a value that you are looking for.
#• You need to transform the data to get the value you would like.
#• Common variables to create:
#  ✓Missingness indicator.
#✓Cutting up quantitative variables. 
#✓Applying transforms

# subsetting variables
data1$STATUS=data1$Group %in% c("Status","Group")
table(data1$STATUS)
# creating binary variables
data1$DATA_VAL_W=ifelse(data1$TIME_REF<0,TRUE,FALSE)
table(data1$DATA_VAL_W, data1$TIME_REF<0)
#easier cutting
#install.packages("Hmisc")
library(Hmisc)
#creating factor variables
data1$fac1<-factor(data1$TIME_REF)
data1$fac1[1:10]
class(data1$fac1)#class is factor
#levels of factor variables
yesno<-sample(c("yeah","nope"),size=10,replace=TRUE)
yesnofac=factor(yesno,levels=c("yeah","nope"))
relevel(yesnofac,ref="yeah")
#to show it into numeric way
as.numeric(yesnofac)
#using the mutate function
library(Hmisc)
#install.packages("plyr") installing a package
library(plyr)
data2=mutate(data1,fac1=cut2(TIME_REF,g=4))
table(data2$fac1)
# main goal is tidy/clean data
#install.packages("reshape2")
library(reshape2)
head(data1)
# melting data frames
data1$names1<-rownames(data1)
hey1<-melt(data1,id=c("UNITS","STATUS"),measure.vars =c("Subject","TIME_REF"))
head(hey1,n=3)
tail(hey1,n=3)
#averaging values
tapply(data1$DATA_VAL,data1$TIME_REF,sum)

# 3rd part of homework
#3) Use the factor function for column "Series_title_1" and get the average for each product using the price values in column "Data_value" by sapply function. 
data1$factis1<-factor(data1$Series_title_1)
data1$factis1[1:10]
sapply(data1$DATA_VAL,sum)
#thanks for your attention and cooperetation;

