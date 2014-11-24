#' Format ggplot2 figures with default theme elements
#' 
#' @description Formats ggplot2 figure with themes that I have custom made for 
#'   figures in various journals. As I make more figure I may have more defaults
#'   to add but currently has the defaults I recently for the journal of 
#'   bioinformatics.
#'   
#' @usage formatFig(type = "bioinformatics")
#'   
#' @author Justin Chu
#'   
#' @details Themes: bioinformatics - a black and white theme with large font
#'   
#' @param type string used to determine what theme to use
#' @examples
#' p <- ggplot(tDat_min, aes(core, time)) + geom_bar(stat="identity")
#' p <- p + formatFig("bioinformatics")
#' 
#' @seealso \code{\link{ggplot2}}
#' 
formatFig <- function(type = "bioinformatics") {
  #if bioinformatics
  if(type == "bioinformatics"){
    return(theme_bw() + theme(legend.key.size=unit(3,"line"),
                              legend.text = element_text(size=20),
                              title=element_text(size=24,face="bold"),
                              axis.text=element_text(size=24),
                              axis.line = element_line(colour = "black"),
                              panel.grid.minor = element_blank(),
                              panel.grid.major = element_blank(),
                              panel.background = element_blank(),
                              panel.border = element_blank()))
  }
  #if type unknown return NULL
  else{
    return(NULL)
  }
}