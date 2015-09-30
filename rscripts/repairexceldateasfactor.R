#####Function for Date Cleansing#######
# Title :- Formatting Dates stored as factors
# Author:- Rahul Kadam
# Date :- 09/28/2015
# Version:- 1.2
# Description:- The function is used to format dates as dates from excel that get saved as factors in ambiguous formats
#               in the same column. Currently handles dates stored as factors in 2 formats in the same column.
#               Format 1:- 324560.3356 (as a result of factor conversion)
#               Format 2:- 2015/09/28 7:00 PM (PM part is an actual text stored in the original excel field 
#                          and gets converted to factor on import)
###########################################

# df=dataframe 
#joinkey=all fields on table except field being repaired
#dtefield= field being repaired
xDateNumText <- function (df,joinkey,dtefield,) 
{
nmdtfld<- names(dtefield)
nmdtfldx<-paste(names(dtefield),".x", sep="")
nmdtfldy<-paste(names(dtefield),".y", sep="")
df<-na.omit(df)
df$nmdtfld<- substr(df$nmdtfld,1,9) # abstracting date part
dtm<-df
dtm$nmdtfld <- suppressWarnings(as.Date(as.numeric(dtm$nmdtfld), origin="1899-12-30")) ### converting dates stored as numerics in the form of factors to dates
mergedt <- merge(df,dtm, by = joinkey)
mergedt$nmdtfldy[is.na(mergedt$nmdtfldy)] <- as.Date(as.character(mergedt$nmdtfldx[is.na(mergedt$nmdtfldy)]), format="%m/%d/%Y") ###converting dates stored with a character like AM/PM to dates
df <- mergedt[,!(names(mergedt) %in% nmdtfldx)]
names(df)[names(df)==nmdtfldy] <- nmdtfld 
return(df)
}
##### End of function #####