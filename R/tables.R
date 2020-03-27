#' Create prettier HTML tables
#' @description A quick wrapper to simplify the presentation of kable tables
#' for this project.
#' @import knitr kableExtra
#' @param DT A data.frame or data.table.
#' @param height character. Passed to `kableExtra::scroll_box`. Will only be
#' used if `addScroll = TRUE`.
#' @param width character. Passed to `kableExtra::scroll_box`. Will only be
#' used if `addScroll = TRUE`.
#' @param addScroll boolean. Controls whether to add a scrollbar to the table.
#' Note that `height` and `width` fix the table to that exact width, there is
#' no autosizing for short tables, so only only use `addScroll` on large tables.
#' @return NULL
#' @export
PrettyTable <- function(DT, height = "400px", width = "900px", addScroll = FALSE){
  out <- kable(DT) %>% kable_styling()
  if(addScroll){ out %<>% scroll_box(width = width, height = height) }
  out
}
