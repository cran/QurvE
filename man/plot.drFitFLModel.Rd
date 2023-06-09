% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fluorescence_plots.R
\name{plot.drFitFLModel}
\alias{plot.drFitFLModel}
\title{Generic plot function for \code{drFitFLModel} objects.}
\usage{
\method{plot}{drFitFLModel}(
  x,
  ec50line = TRUE,
  broken = TRUE,
  bp,
  n.xbreaks,
  n.ybreaks,
  log = c("xy"),
  pch = 1,
  colSpline = 1,
  colData = 1,
  cex.point = 1,
  cex.lab = 1.5,
  cex.axis = 1.3,
  y.lim = NULL,
  x.lim = NULL,
  lwd = 2,
  plot = TRUE,
  export = FALSE,
  height = 7,
  width = 9,
  out.dir = NULL,
  ...
)
}
\arguments{
\item{x}{Object of class \code{drFitFLModel}, created with \code{\link{fl.drFitModel}}.}

\item{ec50line}{(Logical) Show pointed horizontal and vertical lines at the EC50 value (\code{TRUE}) or not (\code{FALSE}).}

\item{broken}{(Logical) If TRUE the x axis is broken provided this axis is logarithmic (using functionality in the CRAN package 'plotrix').}

\item{bp}{(Numeric) Specifying the break point below which the dose is zero (the amount of stretching on the dose axis above zero in order to create the visual illusion of a logarithmic scale including 0). The default is the base-10 value corresponding to the rounded value of the minimum of the log10 values of all positive dose values. This argument is only working for logarithmic dose axes.}

\item{n.xbreaks}{(Numeric) Number of breaks on the x-axis (if not log-transformed). The breaks are generated using \code{pretty}. Thus, the final number of breaks can deviate from the user input.}

\item{n.ybreaks}{(Numeric) Number of breaks on the y-axis (if not log-transformed). The breaks are generated using \code{pretty}. Thus, the final number of breaks can deviate from the user input.#' @param pch (Numeric) Size of the raw data circles.}

\item{log}{(Character) String which contains '"x"' if the x axis is to be logarithmic, '"y"' if the y axis is to be logarithmic and '"xy"' or '"yx"' if both axes are to be logarithmic. The default is "x". The empty string "" yields the original axes.}

\item{pch}{(Numeric) Symbol used to plot data points.}

\item{colSpline}{(Numeric or Character) Color used to plot the splines.}

\item{colData}{(Numeric or Character) Color used to plot the raw data.}

\item{cex.point}{(Numeric) Size of the raw data points.}

\item{cex.lab}{(Numeric) Font size of axis titles.}

\item{cex.axis}{(Numeric) Font size of axis annotations.}

\item{y.lim}{(Numeric vector with two elements) Optional: Provide the lower (\code{l}) and upper (\code{u}) bounds on y-axis as a vector in the form \code{c(l, u)}.}

\item{x.lim}{(Numeric vector with two elements) Optional: Provide the lower (\code{l}) and upper (\code{u}) bounds on the x-axis as a vector in the form \code{c(l, u)}.}

\item{lwd}{(Numeric) Line width.}

\item{plot}{(Logical) Show the generated plot in the \code{Plots} pane (\code{TRUE}) or not (\code{FALSE}).}

\item{export}{(Logical) Export the generated plot as PDF and PNG files (\code{TRUE}) or not (\code{FALSE}).}

\item{height}{(Numeric) Height of the exported image in inches.}

\item{width}{(Numeric) Width of the exported image in inches.}

\item{out.dir}{(Character) Name or path to a folder in which the exported files are stored. If \code{NULL}, a "Plots" folder is created in the current working directory to store the files in.}

\item{...}{Further arguments to refine the generated base R plot.}
}
\value{
A plot with the biosensor dose-response model fit.
}
\description{
Generic plot function for \code{drFitFLModel} objects.
}
\examples{
# Create concentration values via a serial dilution
conc <- c(0, rev(unlist(lapply(1:18, function(x) 10*(2/3)^x))),10)

# Simulate response values via biosensor equation
response <- biosensor.eq(conc, y.min = 110, y.max = 6000, K = 0.5, n = 2) +
            0.01*6000*rnorm(10)

# Perform fit
TestRun <- fl.drFitModel(conc, response, drID = "test", control = fl.control())

print(summary(TestRun))
plot(TestRun)

}
