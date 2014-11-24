#' Return the part of an Object
#' 
#' @description Returns parts of a data frame.
#'   
#' @usage peek(x, ...) peek(x, n = 6, ...) peek(x, n = 6, loc = 0.5)
#' 
#' @return a subset of the input dataframe
#'   
#' @details Uses \code{loc} to determine location of dataframe to look at. Will
#'   only return rows that are before the end of the file. Zero or negative
#'   \code{n} values will cause errors to be returned
#'   
#' @author Justin Chu
#'   
#' @param x A dataframe
#' @param n Number of element wanted to be returned
#' @param loc The location as proportion of file to draw values from
#' @examples
#' testDat <- data.frame( treatment = sample( c("PLACEBO", "300 MG", "600 MG", "1200 MG"), 
#'                                          100, replace=TRUE ))
#' peek(testDat)
#' peek(testDat, 10)
#' peek(testDat, 10, 0.2)
#' peek(testDat, loc = 0.8)
#' 
#' @export
#' 
peek <- function(x, n = 6, loc = 0.5) {
  location <- (nrow(x)*loc)
  endLoc <- location+n
  assertthat::assert_that(n > 0)
  if(endLoc > nrow(x)){
    endLoc = nrow(x)
  }
  if(location > nrow(x)){
    location = nrow(x)
  }
  return(tail(head(x, endLoc), endLoc - location))
}