#'Data Input to Tab seperated file
#'
#'@description \code{writeTSV} is a wrapper around \code{read.table} with 
#'  defaults that read a tab seperated file, without quotes, and with a header.
#'  
#'@usage readTSV(file, header = TRUE, sep = "\\t", quote = "", dec = ".", 
#'  numerals = c("allow.loss", "warn.loss", "no.loss"), row.names, col.names, 
#'  as.is = !stringsAsFactors, na.strings = "NA", colClasses = NA, nrows = -1, 
#'  skip = 0, check.names = TRUE, fill = !blank.lines.skip, strip.white = FALSE,
#'  blank.lines.skip = TRUE, comment.char = "#", allowEscapes = FALSE, flush = 
#'  FALSE, stringsAsFactors = default.stringsAsFactors(), fileEncoding = "", 
#'  encoding = "unknown", text, skipNul = FALSE)
#'  
#'@author Justin Chu
#'  
#'@return a dataframe
#'  
#'@param file the name of the file which the data are to be read from. Each row 
#'  of the table appears as one line of the file. If it does not contain an 
#'  absolute path, the file name is relative to the current working directory, 
#'  getwd(). Tilde-expansion is performed where supported. This can be a 
#'  compressed file (see file).Alternatively, file can be a readable text-mode 
#'  connection (which will be opened for reading if necessary, and if so closed 
#'  (and hence destroyed) at the end of the function call). (If stdin() is used,
#'  the prompts for lines may be somewhat confusing. Terminate input with a 
#'  blank line or an EOF signal, Ctrl-D on Unix and Ctrl-Z on Windows. Any 
#'  pushback on stdin() will be cleared before return.)file can also be a 
#'  complete URL. (For the supported URL schemes, see the ‘URLs’ section of the 
#'  help for url.)
#'@param header a logical value indicating whether the file contains the names 
#'  of the variables as its first line. If missing, the value is determined from
#'  the file format: header is set to TRUE if and only if the first row contains
#'  one fewer field than the number of columns.
#'@param sep	the field separator character. Values on each line of the file are 
#'  separated by this character. If sep = "" (the default for read.table) the 
#'  separator is ‘white space’, that is one or more spaces, tabs, newlines or 
#'  carriage returns.
#'@param quote	the set of quoting characters. To disable quoting altogether, use
#'  quote = "". See scan for the behaviour on quotes embedded in quotes. Quoting
#'  is only considered for columns read as character, which is all of them 
#'  unless colClasses is specified.
#'@param dec	the character used in the file for decimal points.
#'@param numerals	string indicating how to convert numbers whose conversion to 
#'  double precision would lose accuracy, see type.convert.
#'@param row.names	a vector of row names. This can be a vector giving the actual
#'  row names, or a single number giving the column of the table which contains 
#'  the row names, or character string giving the name of the table column 
#'  containing the row names. If there is a header and the first row contains 
#'  one fewer field than the number of columns, the first column in the input is
#'  used for the row names. Otherwise if row.names is missing, the rows are 
#'  numbered. Using row.names = NULL forces row numbering. Missing or NULL 
#'  row.names generate row names that are considered to be ‘automatic’ (and not 
#'  preserved by as.matrix).
#'@param col.names	a vector of optional names for the variables. The default is 
#'  to use "V" followed by the column number.
#'@param as.is	the default behavior of readTSV is to convert character variables
#'  (which are not converted to logical, numeric or complex) to factors. The 
#'  variable as.is controls the conversion of columns not otherwise specified by
#'  colClasses. Its value is either a vector of logicals (values are recycled if
#'  necessary), or a vector of numeric or character indices which specify which 
#'  columns should not be converted to factors. Note: to suppress all 
#'  conversions including those of numeric columns, set colClasses = 
#'  "character". Note that as.is is specified per column (not per variable) and 
#'  so includes the column of row names (if any) and any columns to be skipped.
#'@param na.strings	a character vector of strings which are to be interpreted as
#'  NA values. Blank fields are also considered to be missing values in logical,
#'  integer, numeric and complex fields.
#'@param colClasses	character. A vector of classes to be assumed for the 
#'  columns. Recycled as necessary, or if the character vector is named, 
#'  unspecified values are taken to be NA. Possible values are NA (the default, 
#'  when type.convert is used), "NULL" (when the column is skipped), one of the 
#'  atomic vector classes (logical, integer, numeric, complex, character, raw), 
#'  or "factor", "Date" or "POSIXct". Otherwise there needs to be an as method 
#'  (from package methods) for conversion from "character" to the specified 
#'  formal class. Note that colClasses is specified per column (not per 
#'  variable) and so includes the column of row names (if any).
#'@param nrows	integer: the maximum number of rows to read in. Negative and 
#'  other invalid values are ignored.
#'@param skip	integer: the number of lines of the data file to skip before 
#'  beginning to read data.
#'@param check.names	logical. If TRUE then the names of the variables in the 
#'  data frame are checked to ensure that they are syntactically valid variable 
#'  names. If necessary they are adjusted (by make.names) so that they are, and 
#'  also to ensure that there are no duplicates.
#'@param fill	logical. If TRUE then in case the rows have unequal length, blank 
#'  fields are implicitly added. See ‘Details’.
#'@param strip.white	logical. Used only when sep has been specified, and allows 
#'  the stripping of leading and trailing white space from unquoted character 
#'  fields (numeric fields are always stripped). See scan for further details 
#'  (including the exact meaning of ‘white space’), remembering that the columns
#'  may include the row names.
#'@param blank.lines.skip	logical: if TRUE blank lines in the input are ignored.
#'@param comment.char	character: a character vector of length one containing a 
#'  single character or an empty string. Use "" to turn off the interpretation 
#'  of comments altogether.
#'@param allowEscapes	logical. Should C-style escapes such as \\n be processed
#'  or read verbatim (the default)? Note that if not within quotes these could
#'  be interpreted as a delimiter (but not as a comment character). For more 
#'  details see scan.
#'@param flush	logical: if TRUE, scan will flush to the end of the line after 
#'  reading the last of the fields requested. This allows putting comments after
#'  the last field.
#'@param stringsAsFactors	logical: should character vectors be converted to 
#'  factors? Note that this is overridden by as.is and colClasses, both of which
#'  allow finer control.
#'@param fileEncoding	character string: if non-empty declares the encoding used 
#'  on a file (not a connection) so the character data can be re-encoded. See 
#'  the ‘Encoding’ section of the help for file, the ‘R Data Import/Export 
#'  Manual’ and ‘Note’.
#'@param encoding	encoding to be assumed for input strings. It is used to mark 
#'  character strings as known to be in Latin-1 or UTF-8 (see Encoding): it is 
#'  not used to re-encode the input, but allows R to handle encoded strings in 
#'  their native encoding (if one of those two). See ‘Value’ and ‘Note’.
#'@param text	character string: if file is not supplied and this is, then data 
#'  are read from the value of text via a text connection. Notice that a literal
#'  string can be used to include (small) data sets within R code.
#'@param skipNul	logical: should nuls be skipped?
#'  
#'@examples
#' testDat <- data.frame( treatment = sample( c("PLACEBO", "300 MG", "600 MG", "1200 MG"), 
#'                                          100, replace=TRUE ))
#' write.table(testDat, "testDat.tsv", sep = "\\t", quote = FALSE, row.names = FALSE)
#' readTSV("testDat.tsv")
#' ##cleanup
#' file.remove("testDat.tsv")
#'
#'@seealso see \code{\link{read.table}} for more details.
#'@export
#'
readTSV <- function(file, header = TRUE, sep = "\t", quote = "",
                    dec = ".", numerals = c("allow.loss", "warn.loss", "no.loss"),
                    row.names, col.names, as.is = !stringsAsFactors,
                    na.strings = "NA", colClasses = NA, nrows = -1,
                    skip = 0, check.names = TRUE, fill = !blank.lines.skip,
                    strip.white = FALSE, blank.lines.skip = TRUE,
                    comment.char = "#",
                    allowEscapes = FALSE, flush = FALSE,
                    stringsAsFactors = default.stringsAsFactors(),
                    fileEncoding = "", encoding = "unknown", text, skipNul = FALSE) {
  return(read.table(file, header, sep, quote, dec , numerals, row.names, col.names, as.is,
         na.strings, colClasses, nrows, skip, check.names, fill, strip.white, blank.lines.skip,
         comment.char, allowEscapes, flush, stringsAsFactors, fileEncoding, encoding, text, skipNul))
}