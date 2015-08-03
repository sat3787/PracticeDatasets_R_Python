source("ClearCapital.R");

# Problem 1
V.Size<-seq(1.0,10.0,0.5);
N<-c(5);
op1<-f1(V.Size,N);
print(op1);

# Problem 2
V.Ints<-c(1,1,1,2,2,2,2,3,3,4,4,4,4,4,4,4,5,5,6,6,6,6,7,7,7,7);
op2<-f2(V.Ints);
print(op2);

# Problem 3
V.dates<-c("07/03/2014","02/02/2015","05/01/2015","06/02/2014","07/23/2015","09/09/2015");
op3<-f3(V.dates);
print(op3);

# Problem 4
V.text<-c("Listed on 1/05/2009 for 180000 and sold for $150,250 on 3/1/2009","Insurance sales rose from $14,888,900.90 to $100,100,100.00 and each costs $10 10.00 $10.000 $75,750 12/12/2015 11/23/2014 2/2/2015","Peter dinklage $14,888,900.90 $100,100,100 $10 10.00 $10.000 $75,750 12/12/2015 11/23/2014 2/2/2015");
op4<-f4(V.text);
print(op4);


