# Calculating Most Number of account creations
sortByOpenDate=input[order(input$OpeningDate),]
MostAcc_Dates=tail(sort(table(sortByOpenDate$OpeningDate)),n=10)
LeastAcc_Dates=head(sort(table(sortByOpenDate$OpeningDate)),n=10)
# Plotting top 10 days for account creations
barplot(MostAcc_Dates,col ="green",border = T,main = "Days with most Account creations",las=2,ylab="Number of Accounts",xlab="Date",cex.names=0.5,horiz=F,cex.lab=0.7,col.lab="red",cex.axis=0.5,xpd=F,ylim=c(29850,30200))
box()

# Plotting bottom 10 days for account creations
barplot(LeastAcc_Dates,col ="red",border = T,main = "Days with least Account creations",las=2,ylab="Number of Accounts",xlab="Date",cex.names=0.5,horiz=F,cex.lab=0.7,col.lab="red",cex.axis=0.5,xpd=F,ylim=c(29350,29490))
box()