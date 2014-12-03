# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
Audi_prodaja <- function() {
  return(read.table("AudiByMarkets.csv", sep = ";", as.is = TRUE, skip=5,
                   row.names = 1, na strings="-",
                   col.names = c("1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006"),
                   fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o prodaji vozil Audi od leta 1996 do leta 2006\n")
AudiByMarkets <- Audi_prodaja()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.