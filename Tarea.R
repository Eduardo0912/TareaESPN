##############################
library(XML)
library(RCurl)

#url<-getURL("https://www.w3schools.com/xml/simple.xml")
url<-"http://www.espn.com.mx/futbol-americano/nfl/posiciones"
data<-htmlTreeParse(url,useInternalNodes = TRUE)

EQUIPO<-xpathSApply(data,"//span[@class='team-names'] | //span[@class='team-names inactive']",xmlValue)
CONFERENCIA<-rep(xpathSApply(data,"//span[@class='long-caption']",xmlValue),each=16)
ZONA<-rep(xpathSApply(data,"//thead/th[1]",xmlValue),each=4)
G<-xpathSApply(data,"//td[@class=''][1]",xmlValue)
P<-xpathSApply(data,"//td[@class=''][2]",xmlValue)
E<-xpathSApply(data,"//td[@class=''][3]",xmlValue)
PER<-xpathSApply(data,"//td[@class=''][4]",xmlValue)
GF<-xpathSApply(data,"//td[@class=''][5]",xmlValue)
GC<-xpathSApply(data,"//td[@class=''][6]",xmlValue)
R<-xpathSApply(data,"//td[@class=''][7]",xmlValue)
LOCAL<-xpathSApply(data,"//td[@class='center'][1]",xmlValue)
VISITANTE<-xpathSApply(data,"//td[@class='center'][2]",xmlValue)
DIV<-xpathSApply(data,"//td[@class='center'][3]",xmlValue)
CONF<-xpathSApply(data,"//td[@class='center'][4]",xmlValue)
DIFP<-xpathSApply(data,"//td[@class=' positive'] | //td[@class=' negative']",xmlValue)

POSICIONESNFL2016<-data.frame(cbind(EQUIPO,CONFERENCIA,ZONA,G,P,E,PER,LOCAL,VISITANTE,DIV,CONF,GF,GC,DIFP,R))
POSICIONESNFL2016

