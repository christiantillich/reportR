#' Create a metadata summary of a table.
#' @description
#' @param df A data.frame or data.table.
#' @param exclude character. A vector to exclude certain columns from view.
#' @import lubridate
#' @return NULL
#' @export
VarSum <- function (df, exclude = "values") {
  del <- function (df, c) colnames(df[!colnames(df) %in% c])
  df %<>% as.data.frame
  N <- sapply(df, length, USE.NAMES = F)
  n <- sapply(df, function(x) sum((is.na(x) | is.nan(x) | trimws(x) == "")), USE.NAMES = F)
  c <- sapply(df, class, USE.NAMES = F)
  tz <- ifelse(lapply(c, function(x) any(c('POSIXct','POSIXt','Date') %in% x)), sapply(df, tz), NA)
  r <- ifelse(c %in% c('character','factor'), NA, lapply(df, range, na.rm = TRUE))
  u <- sapply(df, function(x) length(unique(x)), USE.NAMES = F)
  f <- function(x) {
    n <- as.character(head(unique(df[, x]), 20))
    n[is.na(n)] <- "NA"
    n[n == ""] <- "<Empt>"
    g <- function(x) strtrim(paste(x, collapse = ", "), 40)
    if (nchar(g(n)) > 37) {
      n <- paste(g(n), "...", sep = "")
    }
    else (n <- g(n))
    return(n)
  }
  v <- sapply(names(N), f, USE.NAMES = F)
  t <- data.frame(cbind(names(N), N, c, tz, r, n, u, v), row.names = NULL)
  colnames(t) <- c("var", "N", "type", "timezone", "range", "nulls", "distinct","values")
  t$N <- as.integer(as.character(t$N))
  t$nulls <- as.integer(as.character(t$nulls))
  t$distinct <- as.integer(as.character(t$distinct))
  return(t[, del(t, exclude)])
}
