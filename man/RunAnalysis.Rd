% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis.R
\name{RunAnalysis}
\alias{RunAnalysis}
\title{Run Analysis from an R files}
\usage{
RunAnalysis(filepath, outdir, ...)
}
\arguments{
\item{filepath}{character. Path to the R script.}

\item{outdir}{character. Path to the directory you want to output the
file to.}

\item{...}{additional arguments to pass to `rmarkdown::render`}
}
\description{
A quick wrapper around `rmardown::render` to turn a script into
an html document. The big thing here is really keeping the root directory
right where it's at.
}
