Audi_prodaja <- function() {
  return(read.csv2("TABELE/AudiByMarkets.csv", sep = ";", as.is = TRUE,
                   row.names = 1, na.strings="-",
                   fileEncoding = "Windows-1250"))
}

Audi_zaposleni <- function() {
  return(read.csv2("TABELE/AudiEmployees.csv", sep = ";", as.is = TRUE,
                   row.names = 1, na.strings="-",
                   fileEncoding = "Windows-1250"))
}

Audi_modeli <- function() {
  return(read.csv2("TABELE/AudiProduction.csv", sep = ";", as.is = TRUE,
                   row.names = 1, na.strings="-",
                   fileEncoding = "Windows-1250"))
}

AudiByMarkets <- read.csv("TABELE/AudiByMarkets.csv",sep = ";", row.names = 1)
AudiEmployees <- read.csv("TABELE/AudiEmployees.csv",sep = ";", row.names = 1)
AudiProduction <- read.csv("TABELE/AudiProduction.csv",sep = ";", row.names = 1)