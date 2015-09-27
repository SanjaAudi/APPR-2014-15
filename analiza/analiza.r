pdf("slike/Auditrgianaliza.pdf")

pripraviVrstico <- function(podatki) {
  vrstica <- as.numeric(as.vector(podatki))
  vrstica[is.na(vrstica)] = 0
  vrstica <- vrstica / 1000
  return(vrstica)
}

pripraviTabelo <- function(podatki, izbrani) {  
  m <- rbind(pripraviVrstico(podatki[izbrani[1],]))    
  for (k in 2:length(izbrani) ) {
    i <- izbrani[k]
    m <- rbind(m, pripraviVrstico(podatki[i,]))
  }
  return(m)
}

izracunajRange <- function(tabela, barve) {
  g_range <- range(0)
  for (i in 1:nrow(tabela) ) {
    g_range <- range(g_range, tabela[i, ])
  }
  return(g_range)
}

imenaStolpcev <- function(podatki) {
  imena <- names(podatki)
  for (i in 1:length(imena) ) {
    imena[i] <- substr(imena[i], 2, 5)
  }
  return(imena)
}

narisiGraf <- function(tabela, barve, naslov, tekst_x, text_y, col_names, row_names) {
  stLetNapovedi <- 5
  
  xdata <- as.numeric(col_names)  
  first_x <- xdata[1]
  last_x <- tail(xdata, n=1)
  # izracunaj zalogo vrednosti
  g_range <- izracunajRange(tabela)
  g_range[2] <- g_range[2] * 1.5
  # ustvari graf in narisi prvo krivuljo
  x_lim = c(first_x, last_x + stLetNapovedi)
  plot(xdata, tabela[1, ], type="o", 
       xlab=tekst_x, ylab=text_y, col=barve[1], ylim=g_range, 
       axes=TRUE, xlim=x_lim)  
  # narisi se ostale krivulje
  for (i in 2:nrow(tabela) ) {
    lines(xdata, tabela[i, ], type="o", col=barve[i])
  }  
  # napovedne krivulje
  for (i in 1:nrow(tabela) ) {   
    ydata <- tabela[i, ]
    fit <- lm(ydata ~ xdata + I(xdata^2))
    new_xdata <- seq(first_x, last_x + stLetNapovedi, 1)
    coef <- as.numeric(unlist(fit["coefficients"]))
    new_ydata <- coef[1] + new_xdata*coef[2] + new_xdata^2*coef[3]    
    lines(new_xdata,new_ydata, pch=22, lty=2,col=barve[i])
    
    inx <- length(xdata) + 3
    coef<-round(coef, 2)
    text_fun = paste0("x^2*(",toString(coef[3]),") + x*(", toString(coef[2]),") + (" ,toString(coef[1]), ")")
    text_y <- new_ydata[inx] + g_range[2]*0.04
    if (text_y < 0){
      text_y <- 0
    }
    text(new_xdata[inx], y = text_y, labels = text_fun,
         cex = 0.5, col=barve[i], lty=1:1)
  }
  # napisi naslov
  title(main=naslov, col.main="black", font.main=4)
  # legenda
  legend(first_x, g_range[2], row_names, cex=0.8, col=barve, lty=1:1);
}

####################### PRODAJA 
izbrani <- c(1, 4, 5, 6, 12, 13)
# barve <- c("blue", "red", "pink", "green", "brown", "black")
barve <- rainbow(length(izbrani))
barve[2] <- "orange"
tabela_prodaja <- pripraviTabelo(AudiByMarkets, izbrani)

narisiGraf(tabela_prodaja, 
           barve, 
           "Prodaja avtomobilov", 
           "Leta", 
           "Stevilo prodanih Audijev v tisocih", 
           imenaStolpcev(AudiByMarkets),
           row.names(AudiByMarkets)[izbrani])

####################### PROIZVODNJA
izbrani <- c(4, 11, 18, 22, 25, 31)
# barve <- c("blue", "red", 116, "brown", "black", "purple")
barve <- rainbow(length(izbrani))
barve[2] <- "orange"
tabela_proizvodnja <- pripraviTabelo(AudiProduction, izbrani)

narisiGraf(tabela_proizvodnja, 
           barve, 
           "Audi po modelih", 
           "Leta", 
           "Stevilo proizvedenih avtomobilov v tisocih", 
           imenaStolpcev(AudiProduction),
           row.names(AudiProduction)[izbrani])

dev.off()
