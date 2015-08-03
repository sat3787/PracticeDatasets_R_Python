# Creating a pie chart for the monthly distribution of New Accounts
Acc_by_mon=as.data.frame(table(months(sortByOpenDate$OpeningDate)))
slices <- Acc_by_mon$Freq
lbls <-Acc_by_mon$Var1
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(slices,labels = lbls, col=rainbow(length(lbls)),main="Monthly Distribution of New Accounts",radius=1)

# Plotting the time series plot for the number of new accounts
Accts_AllDays=table(sortByOpenDate$OpeningDate)
Freq_Frame=as.data.frame(Accts_AllDays)
colnames(Freq_Frame)<-c("date","NewAccounts")

ggplot(Freq_Frame,aes(x = as.Date(Freq_Frame$date),y=Freq_Frame$NewAccounts))+geom_point(colour = "red")+geom_smooth(colour = "blue",method="loess",size = 1)+scale_y_continuous(limits = c(29000,30200), breaks = seq(29000,30200,250))+ggtitle ("Daily Count of New Accounts")+xlab("Date")+ylab("Count")
