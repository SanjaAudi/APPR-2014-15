# Audi_prodaja <- function() {
#   return(read.csv2("TABELE/AudiByMarkets.csv", sep = ";", as.is = TRUE,
#                    row.names = 1, na.strings="-",
#                    col.names = c("", 1996:2006),
#                    fileEncoding = "Windows-1250"))
# }
# 
# Audi_zaposleni <- function() {
#   return(read.csv2("TABELE/AudiEmployees.csv", sep = ";", as.is = TRUE,
#                    row.names = 1, na.strings="-",
#                    col.names = c("", 1996:2006),
#                    fileEncoding = "Windows-1250"))
# }
# 
# Audi_modeli <- function() {
#   return(read.csv2("TABELE/AudiProduction.csv", sep = ";", as.is = TRUE,
#                    row.names = 1, na.strings="-",
#                    col.names = c("", 1996:2006),
#                    fileEncoding = "Windows-1250"))
# }
branje.csv <- function(csvpath,fileEncoding,separator){
  return(read.csv(file=csvpath,fileEncoding=fileEncoding,sep=separator,dec=",",row.names=1))
}