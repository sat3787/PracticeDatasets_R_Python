library(ggplot2)
# Set the current working directory
setwd("<Enter the path of the working directory here>")

# Read the input data set from the csv file
input<-read.csv("data.csv",header=F)
names(input)<-c("OpeningDate","DaysForPurchase","TotalPurchases")
input$OpeningDate=as.character(input$OpeningDate)
input$OpeningDate=as.Date(input$OpeningDate,"%Y-%m-%d")

# Compute the first purchase date
input$FirstPurchase=input$OpeningDate+input$DaysForPurchase
# Compute the name of the weekday for account creation and first purchase dates
input$SignupDay=weekdays(input$OpeningDate)
input$Day_FP=weekdays(input$FirstPurchase)
input$SignupDay_Code=as.POSIXlt(input$OpeningDate)$wday

# Compute the number of acc creations on each weekday
SignupDay_freq=table(input$SignupDay_Code)
names(SignupDay_freq)=c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
# Plot the frequency of account creations w.r.t the day of the week
barplot(SignupDay_freq,col = rainbow(7),border = T,main = "Signup frequencies across weekdays",las=2,xlab="Number of Signups",ylab="Day of the week",cex.names=0.5,horiz=T,xlim=c(0,450000),cex.lab=0.7,col.lab="red",cex.axis=0.6)
