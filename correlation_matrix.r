library(corrplot)
setwd("~/workspace_linux/BlogCode/correlation-in-r")

data_dir <- "data/"

getPVector <- function(q){
  n <- nrow(q)
  (q[2:n,1] - q[1:(n-1),1])/q[1:(n-1),1]*100
}

importPVector <- function(filename){
  quotes <-  read.csv(paste0(data_dir, filename), header=FALSE, dec=",", sep=";")
  getPVector(quotes)
}

dax <- importPVector("DAX.csv")
sie <- importPVector("SIE.DE.csv")
sap <- importPVector("SAP.DE.csv")
aapl <- importPVector("AAPL.csv")
drw <- importPVector("DRW3.DE.csv")
silver <- importPVector("Silver.csv")

mat <- cbind(dax,sie,sap,aapl,drw,silver)

result <- cor(mat)
round(result,2)

col1 <- colorRampPalette(c("blue", "white","red"))
corrplot(result,  order="AOE", col=col1(100))

