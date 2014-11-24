#' Data Output to Tab seperated file
#' 
#' @description \code{writeTSV} is a wrapper around \code{write.table} with
#'   defaults that write to a tab seperated file without quotes and rownames.
#'   
#' @usage write.table(x, file = "", append = FALSE, quote = FALSE, sep = "\\t", 
#'   eol = "\\n", na = "NA", dec = ".", row.names = FALSE, col.names = TRUE,
#'   qmethod = c("escape", "double"), fileEncoding = "")
#'
#' @return NULL 
#' 
#' @author Justin Chu
#'   
#' @param x the object to be written, preferably a matrix or data frame. If not,
#'   it is attempted to coerce x to a data frame.
#' @param file	either a character string naming a file or a connection open for
#'   writing. "" indicates output to the console.
#' @param append	logical. Only relevant if file is a character string. If TRUE,
#'   the output is appended to the file. If FALSE, any existing file of the name
#'   is destroyed.
#' @param quote	a logical value (TRUE or FALSE) or a numeric vector. If TRUE,
#'   any character or factor columns will be surrounded by double quotes. If a
#'   numeric vector, its elements are taken as the indices of columns to quote.
#'   In both cases, row and column names are quoted if they are written. If
#'   FALSE, nothing is quoted.
#' @param sep	the field separator string. Values within each row of x are
#'   separated by this string.
#' @param eol	the character(s) to print at the end of each line (row). For
#'   example, eol = "\\r\\n" will produce Windows' line endings on a Unix-alike
#'   OS, and eol = "\\r" will produce files as expected by Excel:mac 2004.
#' @param na	the string to use for missing values in the data.
#' @param dec	the string to use for decimal points in numeric or complex
#'   columns: must be a single character.
#' @param row.names	either a logical value indicating whether the row names of x
#'   are to be written along with x, or a character vector of row names to be
#'   written.
#' @param col.names	either a logical value indicating whether the column names
#'   of x are to be written along with x, or a character vector of column names
#'   to be written. See the section on ‘CSV files’ for the meaning of col.names
#'   = NA.
#' @param qmethod	a character string specifying how to deal with embedded double
#'   quote characters when quoting strings. Must be one of "escape" (default for
#'   writeTSV), in which case the quote character is escaped in C style by a
#'   backslash, or "double" (default for write.csv and write.csv2), in which
#'   case it is doubled. You can specify just the initial letter.
#' @param fileEncoding character string: if non-empty declares the encoding to
#'   be used on a file (not a connection) so the character data can be
#'   re-encoded as they are written. See file.
#' @param ...	arguments to writeTSV: append, col.names, sep, dec and qmethod
#'   cannot be altered.
#' 
#' @examples
#' testDat <- data.frame( treatment = sample( c("PLACEBO", "300 MG", "600 MG", "1200 MG"), 
#'                                          100, replace=TRUE ))
#' writeTSV(testDat, "testDat.tsv")
#' ##cleanup
#' file.remove("testDat.tsv")
#' 
#' @seealso see \code{\link{write.table}} for more details.
#' @export
#'   
writeTSV <- function(x, file = "", append = FALSE, quote = FALSE, sep = "\t",
                     eol = "\n", na = "NA", dec = ".", row.names = FALSE,
                     col.names = TRUE, qmethod = c("escape", "double"),
                     fileEncoding = ""){
  return(write.table(x, file, append, quote, sep, eol, na, dec, row.names = TRUE,
              col.names, qmethod, fileEncoding))
}