# PROBLEM 1
# Inputs: Vector of Numbers, Number (N)
# Output: List of length N

f1<-function(V.Size,N){
  if (is.numeric(V.Size) && is.vector(V.Size) && is.numeric(N) && (length(N)==1)){
# sort the input vector in decreasing order and convert it to a matrix
# with N number of columns. Repeat values incase ncol is not a multiple.  
  a=suppressWarnings(matrix(sort(V.Size,decreasing=T),ncol=N,byrow = T));
# calculate the difference between number of elements in the recomputed
# matrix and the input vector
  diff=length(a)-length(V.Size);
# Convert the columns of the recomputed matrix into vectors of output list
# and truncate the repeated values if necessary.
  return(lapply(seq_len(ncol(a)), function(b) if(b<=((ncol(a))-diff)) a[,b] else head(a[,b],-1)));
  } else {
    cat("[Message]:The input values are not valid numeric vectors");
  }
}

# PROBLEM 2
# Input: Vector of integers
# Output: Data frame that contains the freq of values (for freq>1)

f2<-function(V.Ints){
# Error handling  
  if(is.vector(V.Ints) && is.numeric(V.Ints)){
# create a table out of the input vector and convert it to data frame    
  f<-data.frame(table(V.Ints));
  colnames(f)<-c("Value","Occurrences");
# return only those values and freq that occur more than once  
  return(subset(f,Occurrences>1));
  } else {
    cat("[Message]:Input is not a valid vector of integers");
  }
}

# PROBLEM 3
# Input: Vector of date strings
# Output: Data frame that contains the input,no of days away and quarter info.
# Note: An invalid date input is represented as NA in the output.

f3<-function(V.dates){
# Input strings are converted to dates. They are NA if invalid  
  dates <- as.Date(V.dates, "%m/%d/%Y");
# The absolute difference with the current date is calculated  
  diff<-abs(dates-Sys.Date());
# quarter information is assigned 
  qtr<-ifelse(as.numeric(diff) %% 91.0==0.0,floor(diff/91.0)-1
              ,floor(diff/91.0));
# The output data frame is created
  r<-data.frame(V.dates,as.numeric(diff),qtr);
  colnames(r)<-c("InputDate","DaysAway","Quarter");
  return (r);   
}

# PROBLEM 4
# Input: Vector of strings
# Output: List that contains Lists of two vectors: amts and dates
# Assumption: The input strings are similar to the ones given in the question
# i.e. characters and numeric values are seperated by spaces in inputs.

f4<-function(V.text){
# Lookahead and lookback for spaces and first,last characters
# The numeric value may start with $ and first digit should be between
# 1 and 9 followed by optional digits,commas,decimal points, digits after decimals.  
  amount_pattern<-"(?<=^| )(\\$)?[1-9]\\d*((,\\d{3,3})?)+(\\.\\d+)?(?= |$)"
# Date must match mm/dd/yyyy or m/d/yyyy; other cases are invalid  
  date_pattern <- "(?<=^| )\\d{1,2}/\\d{1,2}/\\d{4,4}(?=$|.|,| )";
# output a list of list of the two vectors
  output<-lapply(V.text,function(h) list(amt=regmatches(h, gregexpr(amount_pattern,h, perl=T)),date=regmatches(h, gregexpr(date_pattern,h, perl=T))));
  return(output);
}
