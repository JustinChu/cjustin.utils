#' Reorder Levels of a Factor in reverse order
#' 
#' @description reorderdesc is a generic function. The "default" method treats
#'   its first argument as a categorical variable, and reorders its levels based
#'   on the values of a second variable, usually numeric. This version will
#'   reorder the levels in the opposite order than the original \code{reorder}
#'   function. This function is a wrapper around the \code{reorder} and
#'   \code{desc} (from dplyr) functions.
#'   
#' @usage reorder(x, ...) reorder(x, X, FUN = mean, ..., order = is.ordered(x))
#' 
#' @return the dataframe inputed but with factors reordered in descending order
#' 
#' @details Uses \code{loc} to determine location of dataframe to look at. Will 
#'   only return rows that are before the end of the file. Zero or negative 
#'   \code{n} values will cause function to return empty dataframes.
#'   
#' @author Justin Chu
#'   
#' @param x  An atomic vector, usually a factor (possibly ordered). The vector 
#'   is treated as a categorical variable whose levels will be reordered. If x 
#'   is not a factor, its unique values will be used as the implicit levels.
#' @param X	a vector of the same length as x, whose subset of values for each 
#'   unique level of x determines the eventual order of that level.
#' @param order logical, whether return value will be an ordered factor rather 
#'   than a factor.
#' @examples
#'    # Create a 4 level example factor
#'    trt <- factor( sample( c("PLACEBO", "300 MG", "600 MG", "1200 MG"),
#'                           100, replace=TRUE ) )
#'    levels(trt)
#'    levels(reorder(trt, order(trt)))
#'    levels(reorderdesc(trt, order(trt)))
#' 
#' @seealso see \code{\link{reorder}} for more details.
#' @export
#'   
reorderdesc <- function(x, X, order = is.ordered(x)){
  return(reorder(x, dplyr::desc(X), order = order))
}
