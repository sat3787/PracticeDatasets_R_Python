# Aggregating the First Purchase data
Fast_Purchase=aggregate(input$OpeningDate~input$DaysForPurchase,input,FUN=length)
names(Fast_Purchase)<-c("DaysforPurch","Num_EarlyBuyers")
boxplot(input$DaysForPurchase,main="The First Purchase",col=c("green"),xlab="Days for First Purchase",horizontal=T)

# Aggregating the purchase and speed of purchase data for analysis
f1<-aggregate(input$TotalPurchases~input$DaysForPurchase,data=input,FUN=sum)
Analysis<-data.frame(f1,Fast_Purchase$Num_EarlyBuyers)
colnames(Analysis)<-c("Early_Buying","purch_total","FastBuyers_num")

# Aggregating the purchase count data
Num_Purchase=aggregate(input$OpeningDate~input$TotalPurchases,input,FUN=length)
colnames(Num_Purchase)<-c("Num_Purchased","Customer_Count")
boxplot(input$TotalPurchases,main="Purchases made by customer",col=c("red"),xlab="Number of Purchases",horizontal=T)

# Plotting the buying pattern of 2-ITEM buyers
ggplot(subset(input,TotalPurchases==2),aes(x=DaysForPurchase))+geom_density(adjust=5,colour="darkgreen", size=1, fill="green")+ggtitle("Purchasing Pattern of 2-Item Buyers")+xlab("First Purchase Day")

# Early buying vs Number of Purchases
ggplot(Analysis, aes(x = Early_Buying,y=(purch_total/FastBuyers_num))) + geom_bar(color="red",width=0.4,stat="identity")+ggtitle("Average purchases on the basis of Early Buying")+xlab("Days After Signup")+ylab("Count")