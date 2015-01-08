source("podatki2faza/readcsv.r")

AudiByMarkets <- read.csv("TABELE/AudiByMarkets.csv",sep = ";", row.names = 1)
AudiEmployees <- read.csv("TABELE/AudiEmployees.csv",sep = ";", row.names = 1)
AudiProduction <- read.csv("TABELE/AudiProduction.csv",sep = ";", row.names = 1)