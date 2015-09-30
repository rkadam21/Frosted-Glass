repairExcelDates <- function(x, yearcol=3, fmt="%m/%d/%Y") {
  x <-  do.call(rbind, lapply(strsplit(x, "/"), as.numeric))
  year <- x[,yearcol]
  if(any(year>99)) stop("dont'know what to do")
  x[,yearcol] <- ifelse(year <= as.numeric(format(Sys.Date(), "%Y")), year+2000, year + 1900) 
  # if year <= current year then add 2000, otherwise add 1900
  x <- apply(x, 1, paste, collapse="/")
  as.Date(x, format=fmt)
}
