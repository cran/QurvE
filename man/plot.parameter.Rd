% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/growth_plots.R
\name{plot.parameter}
\alias{plot.parameter}
\title{Compare growth parameters between samples or conditions}
\usage{
\method{plot}{parameter}(
  x,
  param = c("mu.linfit", "lambda.linfit", "dY.linfit", "A.linfit", "mu2.linfit",
    "lambda2.linfit", "mu.model", "lambda.model", "A.model", "A.orig.model", "dY.model",
    "dY.orig.model", "tD.linfit", "tD2.linfit", "tD.spline", "tD2.spline", "mu.spline",
    "lambda.spline", "A.spline", "dY.spline", "integral.spline", "mu2.spline",
    "lambda2.spline", "mu.bt", "lambda.bt", "A.bt", "integral.bt", "max_slope.linfit",
    "max_slope.spline"),
  IDs = NULL,
  names = NULL,
  conc = NULL,
  exclude.nm = NULL,
  exclude.conc = NULL,
  reference.nm = NULL,
  reference.conc = NULL,
  order_by_conc = FALSE,
  colors = NULL,
  basesize = 12,
  label.size = NULL,
  shape.size = 2.5,
  legend.position = "right",
  legend.ncol = 1,
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
\item{x}{A \code{grofit}, \code{gcFit}, or \code{gcTable} object obtained with \code{\link{growth.workflow}} or \code{\link{growth.gcFit}}.}

\item{param}{(Character) The parameter used to compare different sample groups. Any name of a column containing numeric values in \code{gcTable} (which is stored within \code{grofit} or \code{gcFit} objects) can be used as input. Useful options are:
'mu.linfit', 'lambda.linfit', 'dY.linfit', 'A.linfit',
'mu.model', 'lambda.model', 'A.model',
'mu.spline', 'lambda.spline', 'A.spline', 'dY.spline', 'integral.spline',
'mu.bt', 'lambda.bt', 'A.bt', 'integral.bt'}

\item{IDs}{(String or vector of strings) Define samples or groups (if \code{mean = TRUE}) to combine into a single plot based on exact matches with entries in the \code{label} or \code{condition} columns of \code{grofit$expdesign}.}

\item{names}{(String or vector of strings) Define groups to combine into a single plot. Partial matches with sample/group names are accepted. If \code{NULL}, all samples are considered. Note: Ensure to use unique substrings to extract groups of interest. If the name of one condition is included in its entirety within the name of other conditions, it cannot be extracted individually.}

\item{conc}{(Numeric or numeric vector) Define concentrations to combine into a single plot. If \code{NULL}, all concentrations are considered. Note: Ensure to use unique concentration values to extract groups of interest. If the concentration value of one condition is included in its entirety within the name of other conditions (e.g., the dataset contains '1', '10', and '100', \code{code = 10} will select both '10 and '100'), it cannot be extracted individually.}

\item{exclude.nm}{(String or vector of strings) Define groups to exclude from the plot. Partial matches with sample/group names are accepted.}

\item{exclude.conc}{(Numeric or numeric vector) Define concentrations to exclude from the plot.}

\item{reference.nm}{(Character) Name of the reference condition, to which parameter values are normalized. Partially matching strings are tolerated as long as they can uniquely identify the condition.}

\item{reference.conc}{(Numeric) Concentration of the reference condition, to which parameter values are normalized.}

\item{order_by_conc}{(Logical) Shall the columns be sorted in order of ascending concentrations (\code{TRUE}) or by sample groups \code{FALSE}?}

\item{colors}{(vector of strings) Define a color palette used to draw the columns. If \code{NULL}, default palettes are chosen. Note: The number of provided colors should at least match the number of groups.}

\item{basesize}{(Numeric) Base font size.}

\item{label.size}{(Numeric) Font size for sample labels below x-axis.}

\item{shape.size}{(Numeric) The size of the symbols indicating replicate values. Default: 2.5}

\item{legend.position}{(Character) Position of the legend. One of "bottom", "top", "left", "right".}

\item{legend.ncol}{(Numeric) Number of columns in the legend.}

\item{plot}{(Logical) Show the generated plot in the \code{Plots} pane (\code{TRUE}) or not (\code{FALSE}). If \code{FALSE}, a ggplot object is returned.}

\item{export}{(Logical) Export the generated plot as PDF and PNG files (\code{TRUE}) or not (\code{FALSE}).}

\item{height}{(Numeric) Height of the exported image in inches.}

\item{width}{(Numeric) Width of the exported image in inches.}

\item{out.dir}{(Character) Name or path to a folder in which the exported files are stored. If \code{NULL}, a "Plots" folder is created in the current working directory to store the files in.}

\item{out.nm}{(Character) The name of the PDF and PNG files if \code{export = TRUE}. If \code{NULL}, a name will be automatically generated including the chosen parameter.}

\item{...}{Additional arguments. This has currently no effect and is only meant to fulfill the requirements of a generic function.}
}
\value{
A column plot comparing a selected growth parameter between tested conditions.
}
\description{
\code{plot.parameter} gathers physiological parameters from the results of a growth fit analysis and compares a chosen parameter between each sample or condition in a column plot. Error bars represent the 95\% confidence interval (only shown for > 2 replicates).
}
\examples{
# Create random growth data set
rnd.data1 <- rdm.data(d = 35, mu = 0.8, A = 5, label = "Test1")
rnd.data2 <- rdm.data(d = 35, mu = 0.6, A = 4.5, label = "Test2")

rnd.data <- list()
rnd.data[["time"]] <- rbind(rnd.data1$time, rnd.data2$time)
rnd.data[["data"]] <- rbind(rnd.data1$data, rnd.data2$data)

# Run growth curve analysis workflow
res <- growth.workflow(time = rnd.data$time,
                       data = rnd.data$data,
                       fit.opt = "s",
                       ec50 = FALSE,
                       export.res = FALSE,
                       parallelize = FALSE,
                       suppress.messages = TRUE)


plot.parameter(res,
               param = "mu.spline",
               legend.ncol = 4,
               legend.position = "bottom",
               basesize = 15,
               label.size = 11)

}
