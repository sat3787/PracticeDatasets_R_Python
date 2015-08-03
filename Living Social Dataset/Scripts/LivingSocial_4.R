# Trend of number of buyers on the SAME DAY of Account Creation
SameDayBuyers=as.data.frame(table(input[input$DaysForPurchase==0,1]))
SameDayBuyers<-SameDayBuyers[order(-SameDayBuyers$Freq),]
SameDayBuyers<-SameDayBuyers[order(SameDayBuyers$Var1),]
colnames(SameDayBuyers)<-c("Date","Count")
summary(SameDayBuyers$Freq)
ggplot(SameDayBuyers, aes(group=1,   x=as.Date(Date), y=Count)) +geom_point()+geom_line() + geom_smooth(method="lm")+ggtitle("Fast Buyers (Oct'10 - Feb'11) ")+xlab("Date")
