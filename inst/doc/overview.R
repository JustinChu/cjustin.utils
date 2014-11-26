## ------------------------------------------------------------------------
library(cjustin.utils)
testDat <- data.frame( treatment = sample( c("PLACEBO", "300 MG", "600 MG", "1200 MG"),
                       100, replace=TRUE ))
knitr::kable(tail(testDat, 10), format = "markdown")

## ------------------------------------------------------------------------
writeTSV(testDat, "testDat.tsv")

#does file exist
file.exists("testDat.tsv")
testDat2 <- read.table("testDat.tsv", sep = "\t", quote = "")

#does file load correctly
knitr::kable(tail(testDat2, 10), format = "markdown")

## ------------------------------------------------------------------------
testDat3 <- readTSV("testDat.tsv")

#does file load correctly
knitr::kable(tail(testDat3, 10), format = "markdown")

#check if identical to original
identical(testDat3, testDat)

#cleanup
file.remove("testDat.tsv")

## ------------------------------------------------------------------------
knitr::kable(peek(testDat), format = "markdown")

## ------------------------------------------------------------------------
knitr::kable(peek(testDat, 10), format = "markdown")

## ------------------------------------------------------------------------
knitr::kable(peek(testDat, 10, 0.1), format = "markdown")

## ----, fig.show='hold'---------------------------------------------------
library(ggplot2)
p <- ggplot(testDat, aes(treatment)) + geom_bar()
#without formatting
p
#with formatting
p + formatFig("bioinformatics")

## ----, fig.show='hold'---------------------------------------------------
library(ggplot2)
p
#with formatting
p + formatFig("markdown")

## ----, fig.show='hold'---------------------------------------------------
formatFig("NOT A THEME")

## ----, fig.show='hold'---------------------------------------------------
library(ggplot2)
#reorder using reorder + order
reorderedDat <- testDat
reorderedDat$treatment <- reorder(testDat$treatment, order(testDat$treatment))
reorderedDescDat <- testDat
reorderedDescDat$treatment <- reorderdesc(testDat$treatment, order(testDat$treatment))
#factors ordered in ascending order
ggplot(reorderedDat, aes(treatment)) + geom_bar()
#factors ordered in desceding order
ggplot(reorderedDescDat, aes(treatment)) + geom_bar()

