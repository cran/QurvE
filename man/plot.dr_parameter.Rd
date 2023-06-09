% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/growth_plots.R
\name{plot.dr_parameter}
\alias{plot.dr_parameter}
\title{Compare calculated dose-response parameters between conditions.}
\usage{
\method{plot}{dr_parameter}(
  x,
  param = c("EC50", "EC50.Estimate", "y.max", "y.min", "fc", "K", "n", "yEC50",
    "drboot.meanEC50", "drboot.meanEC50y", "EC50.orig", "yEC50.orig"),
  names = NULL,
  exclude.nm = NULL,
  basesize = 12,
  reference.nm = NULL,
  label.size = NULL,
  plot = TRUE,
  export = FALSE,
  height = 7,
  width = NULL,
  out.dir = NULL,
  out.nm = NULL,
  ...
)
}
\arguments{
\item{x}{A \code{grofit}, \code{drFit}, \code{drTable}, or \code{flFitRes} object obtained with \code{\link{growth.workflow}}, \code{\link{growth.drFit}}, \code{\link{fl.drFit}}, or \code{\link{fl.workflow}}.}

\item{param}{(Character) The parameter used to compare different sample groups. Any name of a column containing numeric values in \code{gcTable} (which is stored within \code{grofit} or \code{gcFit} objects) can be used as input. Useful options are:
'y.max', 'y.min', 'fc', 'K', or 'n' for fluorescence dose-response analyses with \code{dr.type = 'model'} in the \code{control} argument,
or 'EC50', 'yEC50', 'drboot.meanEC50', 'drboot.meanEC50y'.}

\item{names}{(String or vector of strings) Define groups to combine into a single plot. Partial matches with sample/group names are accepted. If \code{NULL}, all samples are considered. Note: Ensure to use unique substrings to extract groups of interest. If the name of one condition is included in its entirety within the name of other conditions, it cannot be extracted individually.}

\item{exclude.nm}{(String or vector of strings) Define groups to exclude from the plot. Partial matches with sample/group names are accepted.}

\item{basesize}{(Numeric) Base font size.}

\item{reference.nm}{(Character) Name of the reference condition, to which parameter values are normalized. Partially matching strings are tolerated as long as they can uniquely identify the condition.}

\item{label.size}{(Numeric) Font size for sample labels below x-axis.}

\item{plot}{(Logical) Show the generated plot in the \code{Plots} pane (\code{TRUE}) or not (\code{FALSE}). If \code{FALSE}, a ggplot object is returned.}

\item{export}{(Logical) Export the generated plot as PDF and PNG files (\code{TRUE}) or not (\code{FALSE}).}

\item{height}{(Numeric) Height of the exported image in inches.}

\item{width}{(Numeric) Width of the exported image in inches.}

\item{out.dir}{(Character) Name or path to a folder in which the exported files are stored. If \code{NULL}, a "Plots" folder is created in the current working directory to store the files in.}

\item{out.nm}{(Character) The name of the PDF and PNG files if \code{export = TRUE}. If \code{NULL}, a name will be automatically generated including the chosen parameter.}

\item{...}{Additional arguments. This has currently no effect and is only meant to fulfill the requirements of a generic function.}
}
\value{
A column plot comparing a selected parameter of a dose-response analysis between tested conditions.
}
\description{
\code{plot.dr_parameter} gathers parameters from the results of a dose-response analysis and compares a chosen parameter between each condition in a column plot. Error bars represent the 95\% confidence interval (only shown for > 2 replicates).
}
\examples{
\donttest{
# Create random growth data set
rnd.data1 <- rdm.data(d = 35, mu = 0.8, A = 5, label = "Test1")
rnd.data2 <- rdm.data(d = 35, mu = 0.6, A = 4.5, label = "Test2")

rnd.data <- list()
rnd.data[["time"]] <- rbind(rnd.data1$time, rnd.data2$time)
rnd.data[["data"]] <- rbind(rnd.data1$data, rnd.data2$data)

# Run growth curve analysis workflow
gcFit <- growth.gcFit(time = rnd.data$time,
                       data = rnd.data$data,
                       parallelize = FALSE,
                       control = growth.control(fit.opt = "s",
                                                suppress.messages = TRUE))

# Perform dose-response analysis
drFit <- growth.drFit(gcTable = gcFit$gcTable,
            control = growth.control(dr.parameter = "mu.spline"))

plot.dr_parameter(drFit, param = 'EC50')
}

}
