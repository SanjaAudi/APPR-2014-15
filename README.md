# Analiza podatkov s programom R, 2014/15

Avtor: Sanja Milojević

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

Prodaja avtomobilov Audi.

V tem projektu želim prikazati prodajo in cene avtomobilske znamke Audi skozi leta in primerjati stroške nakupa različnih modelov te znamke.
Na voljo imam veliko spletnih strani ki govorijo o modelih te znamke in o njihovi prodaji.
Naprimer:

* http://www.kiplinger.com/tool/cars/T011-S001-2012-new-car-rankings-compare-costs-performance-da/index.php?table=sedan&mfr=Audi&filter=all kjer podatke dobim v zelo urejeni obliki

* zmogljivosti, oprema in cene: http://www.audi.ie/ie_partner/p_00236/en/models/A1/A2_2.html

* primerjava prodaj v letu 2o13 s prodajo drugih znamk avtomobilov: http://www.thisismoney.co.uk/money/cars/article-2399902/Top-20-biggest-selling-cars-2013.html

* primerjava do treh avtomobilov: http://www.motortrend.com/cars/2015/audi/q3/comparisons/make.html

* tabela s podatki o prodaji Audijevih avtomobilov po različnih državah za dve leti: http://www.volkswagenag.com/content/vwcorp/info_center/en/news/2013/05/Audi_AG_Further_Sales

* geografski podatki (želim predstaviti mesto nastanka znamke Audi - Ingolstadt): http://en.wikipedia.org/wiki/Ingolstadt, 

* tržni deleži avtomobilskih proizvajalcev za Veliko Britanijo : http://3.bp.blogspot.com/-Dl8rL9i16qM/TzEkxyevW8I/AAAAAAAAT4s/PakC_Mqf8Pw/s1600/UK_auto-brand-market-share-chart-January-2012.jpeg

* tržni deleži avtomobilskih proizvajalcev za Ameriko: http://4.bp.blogspot.com/-cvBkqZSENlo/UI57HZ-T5yI/AAAAAAAAYyo/LNlvmxytn8k/s1600/European-auto-brands-USA-market-share-chart-2012.jpeg

* tržni deleži avtomobilskih proizvajalcev za Evropo: http://www.google.si/imgres?imgurl=http%3A%2F%2Fwww.infiniteunknown.net%2Fwp-content%2Fuploads%2F2012%2F12%2FEurope-Car-Sales-Crash.jpg&imgrefurl=http%3A%2F%2Fwww.infiniteunknown.net%2Ftag%2Fbmw%2F&h=638&w=1000&tbnid=RXEN2iRLHPNxEM%3A&zoom=1&docid=70tHLITUCm4n3M&ei=V4ZmVMbXOOSnygOPnIDgAg&tbm=isch&ved=0CEQQMygcMBw&iact=rc&uact=3&dur=797&page=2&start=27&ndsp=33

Zadnje tri lahko kasneje tudi prikažem na zemljevidu.

Naredila bom analizo podatkov o prodaji različnih znamk avtomobilov in preverila kateremu gre najbolje in kateri izgublja tržne deleže, predvsem pa želim ugotoviti na katero mesto spada Audi. Po tem ko to ugotovim me pa zanima enako še za modele samo te znamke avtomobilov. Torej od najbolje do najslabše prodajanega Audija.

## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
