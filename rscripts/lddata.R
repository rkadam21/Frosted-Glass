#####Function for read data from Excel#######
# Title :- Read data from Excel
# Author:- Rahul Kadam
# Date :- 09/27/2015
# Version:- 1.1
# Description:- The function is used to read data from excel files and load in into data frames.
#               The function allows to use a mapping document to map the data elements to internal standard
#               mappings. It also allows to name the data frames in the mapping document.
###########################################
## idn = list of sheets that need to be read
## datafileloc = location for data file
## mapfileloc = location for mapping file

lddata <-function(idn,datafileloc,mapfileloc)
{
  dfmp <- read.xlsx(mapfileloc,sheetIndex=1) ###reading the mapping document
  for (i in seq_along(idn)) ### cycle thru multiple sheets if needed
  {  
    temp <<- read.xlsx(datafileloc, sheetName=idn[i],n=1)
    colnames(temp) <<- as.character(dfmp$NewFieldName[dfmp$SheetName==idn[i]])
    assign (as.character(head(dfmp$TableName[dfmp$SheetName==idn[i]],n=1) ), temp, envir = parent.frame())
    
  }
  
}