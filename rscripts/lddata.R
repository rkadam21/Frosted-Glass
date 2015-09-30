
lddata <-function(idn,datafileloc,mapfileloc)
{
  dfmp <- read.xlsx(mapfileloc,sheetIndex=1)
  for (i in seq_along(idn))
  {  
    temp <<- read.xlsx(datafileloc, sheetName=idn[i],n=1)
    colnames(temp) <<- as.character(dfmp$NewFieldName[dfmp$SheetName==idn[i]])
    assign (as.character(head(dfmp$TableName[dfmp$SheetName==idn[i]],n=1) ), temp, envir = parent.frame())
    
  }
  
}