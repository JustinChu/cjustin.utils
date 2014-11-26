#' Format ggplot2 figures with default theme elements
#' 
#' @description Formats ggplot2 figure with themes that I have custom made for 
#'   figures in various journals. As I make more figure I may have more defaults
#'   to add but currently has the defaults I recently for the journal of 
#'   bioinformatics.
#'   
#' @usage formatFig(type = "bioinformatics")
#'        formatFig(type = "markdown")
#' 
#' @return a list containing theme options for ggplot2
#'   
#' @author Justin Chu
#'   
#' @details Themes: bioinformatics - a black and white theme with large font
#'          markdown - general purpose theme for markdown document
#'   
#' @param type string used to determine what theme to use
#' @examples
#' library(ggplot2)
#' testDat <- data.frame( treatment = sample( c("PLACEBO", "300 MG", "600 MG", "1200 MG"), 
#'                                          100, replace=TRUE ))
#' p <- ggplot(testDat, aes(treatment)) + geom_bar()
#' p <- p + formatFig("bioinformatics")
#' 
#' @seealso \code{\link{ggplot2}}
#' @export
formatFig <- function(type = "bioinformatics") {
  #if bioinformatics
  if(type == "bioinformatics"){
    return(.bioinformaticsTheme())
  }
  else if(type == "markdown"){
    return(.markdownTheme())
  }
  #if type unknown return NULL
  else{
    warning("type not recognized")
    return(NULL)
  }
}

#helper functions
.bioinformaticsTheme <- function(){
  return(ggplot2::theme_bw() + 
         ggplot2::theme(legend.key.size=grid::unit(3,"line"),
         legend.text = ggplot2::element_text(size=20),
         title = ggplot2::element_text(size=24,face="bold"),
         axis.text = ggplot2::element_text(size=24),
         axis.line = ggplot2::element_line(colour = "black"),
         panel.grid.minor = ggplot2::element_blank(),
         panel.grid.major = ggplot2::element_blank(),
         panel.background = ggplot2::element_blank(),
         panel.border = ggplot2::element_blank()))
}

.markdownTheme <- function(){
  return(ggplot2::theme_bw() +
         ggplot2::theme(panel.grid.major = ggplot2::element_blank(), 
                        panel.grid.minor = ggplot2::element_blank(),
                        axis.text.x = ggplot2::element_text(angle = 45, hjust = 1)))
}
