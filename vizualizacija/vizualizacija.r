# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                          "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                          encoding = "Windows-1252")

row.names(AudiByMarkets)[3:4] <- c("United Kingdom", "United States")

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
# preuredi <- function(podatki, zemljevid) {
#   nove.obcine <- c()
#   manjkajo <- ! nove.obcine %in% rownames(podatki)
#   M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
#   names(M) <- names(podatki)
#   row.names(M) <- nove.obcine[manjkajo]
#   podatki <- rbind(podatki, M)
#   
#   out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$OB_UIME)[rank(zemljevid$OB_UIME)]), ]
#   if (ncol(podatki) == 1) {
#     out <- data.frame(out)
#     names(out) <- names(podatki)
#     rownames(out) <- rownames(podatki)
#   }
#   return(out)
# }

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
#druzine <- preuredi(druzine, obcine)

# Izračunamo povprečno velikost družine.
min.2006 <- min(AudiByMarkets$X2006[1:13], na.rm=TRUE)
max.2006 <- max(AudiByMarkets$X2006[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid_prodaja.pdf")

n = 100
barve = heat.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2006-min.2006)/(max.2006-min.2006)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])

dev.off()

evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
title("Prodaja v Evropi")

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2006, max.2006, (max.2006-min.2006)/(k-1))),
       fill = barve[koraki*n/k])
