#' Return the part of an Object
#' 
#' @description Returns parts of a data frame.
#'   
#' @usage peek(x, ...) peek(x, n = 6, ...) peek(x, n = 6, loc = 0.5)
#'   
#' @details Uses \code{loc} to determine location of dataframe to look at. Will
#'   only return rows that are before the end of the file. Zero or negative
#'   \code{n} values will cause function to return empty dataframes.
#'   
#' @author Justin Chu
#'   
#' @param x A dataframe
#' @param n Number of element wanted to be returned
#' @param loc The location as proportion of file to draw values from
#' @examples
#' peek(x)
#' peek(x, 10)
#' peek(x, 10, 0.2)
#' peek(x, loc = 0.8)
#' 
peek <- function(x, n = 6, loc = 0.5) {
  location <- (nrow(x)*loc)
  endLoc <- location+n-1
  if(endLoc > nrow(x)){
    endLoc = nrow(x)
  }
  if(location > nrow(x)){
    location = nrow(x)
  }
  if(n < 1){
    return(x[0,])
  }
  return(x[location:endLoc,])
}