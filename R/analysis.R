#' Run Analysis from an R files
#' @description A quick wrapper around `rmardown::render` to turn a script into
#' an html document. The big thing here is really keeping the root directory
#' right where it's at.
#' @import rmarkdown
#' @param filepath character. Path to the R script.
#' @param outdir character. Path to the directory you want to output the
#' file to.
#' @param ... additional arguments to pass to `rmarkdown::render`
#' @return NULL
#' @export
RunAnalysis <- function(filepath, outdir, ...){
  render(filepath, output_dir = outdir, knit_root_dir = getwd(), envir = globalenv())
  # I have no clue why this envir line is needed, but it seems to be a recurrence
  # of this bug: https://github.com/rstudio/rmarkdown/issues/278
}
