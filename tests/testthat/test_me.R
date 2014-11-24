library(dplyr)

#tests for formatFig.R
test_that("default output is returned", {
  expect_true(!is.null(formatFig()))
})
test_that("selected output is returned", {
  expect_true(!is.null(formatFig("bioinformatics")))
})
test_that("warning is returned when type is not recognized", {
  expect_warning(formatFig(type = "notAType"), "type not recognized")
})

# Create a test dataframe
testDat <- data.frame( treatment = sample( c("PLACEBO", "300 MG", "600 MG", "1200 MG"),
                       100, replace=TRUE ))

#tests for writeTSV
test_that("File is written", {
  writeTSV(testDat, "testDat.tsv")
  expect_true(file.exists("testDat.tsv"))
  file.remove("testDat.tsv")
})

test_that("the output is seperated by tabs", {
  writeTSV(testDat, "testDat.tsv")
  expect_error(read.table("testDat.tsv"), "line 1 did not have 3 elements")
  expect_true(!is.null(read.table("testDat.tsv", sep = "\t")))
  file.remove("testDat.tsv")
})

test_that("the output does not have quotes", {
  writeTSV(testDat, "testDat.tsv")
  dat <- read.table("testDat.tsv", sep = "\t", quote = "")
  expect_true(is.null(nrow(grep("\"", dat))))
  file.remove("testDat.tsv")
})

#tests for readTSV

test_that("the header is not malformed", {
  write.table(testDat, "testDat.tsv", sep = "\t", quote = FALSE, row.names = FALSE)
  readTSV("testDat.tsv")
  expect_equal(colnames(testDat), "treatment")
  file.remove("testDat.tsv")
})

test_that("read file is identical to source", {
  write.table(testDat, "testDat.tsv", sep = "\t", quote = FALSE, row.names = FALSE)
  dat <- readTSV("testDat.tsv")
  expect_identical(testDat, dat)
  file.remove("testDat.tsv")
})

test_that("it has quotes are retained", {
  write.csv(testDat, "testDat.csv")
  expect_true(is.null(nrow(grep("\"", readTSV("testDat.csv")))))
  file.remove("testDat.csv")
})

#tests for peek

test_that("rows past length of dataframe remains cut off", {
  expect_true( 50 == nrow(peek(testDat, 100)))
})

test_that("a error is returned when n is less than zero", {
  expect_error(is.null(nrow(peek(testDat, -1))))
})

test_that("location will change the location of where well like in the dataframe", {
  expect_true( 90 == nrow(peek(testDat, 100, 0.1)))
})


#tests for reorderdesc
test_that("data reordered is not equal to reorderdesc data", {
  expect_false(identical(reorder(testDat, order(testDat)), 
                         reorderdesc(testDat, order(testDat))))
})

test_that("data is reordered from unordered default", {
  expect_false(identical(testDat, reorderdesc(testDat, order(testDat))))
})

test_that("data is reordered in descending order", {
  expect_true(identical(reorder(testDat, desc(order(testDat))), 
                        reorderdesc(testDat, order(testDat))))
})
