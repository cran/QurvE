% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fluorescence_summaries.R
\name{summary.flFitSpline}
\alias{summary.flFitSpline}
\title{Generic summary function for flFitSpline objects}
\usage{
\method{summary}{flFitSpline}(object, ...)
}
\arguments{
\item{object}{object of class \code{flFitSpline}}

\item{...}{Additional arguments. This has currently no effect and is only meant to fulfill the requirements of a generic function.}
}
\value{
A dataframe with parameters extracted from a nonparametric fit.
}
\description{
Generic summary function for flFitSpline objects
}
\examples{
# load example dataset
input <- read_data(data.growth = system.file("lac_promoters_growth.txt", package = "QurvE"),
                   data.fl = system.file("lac_promoters_fluorescence.txt", package = "QurvE"),
                   csvsep = "\t",
                   csvsep.fl = "\t")

# Extract time and normalized fluorescence data for single sample
time <- input$time[4,]
data <- input$norm.fluorescence[4,-(1:3)] # Remove identifier columns

# Perform linear fit
TestFit <- flFitSpline(time = time,
                       fl_data = data,
                       ID = 'TestFit',
                       control = fl.control(fit.opt = 's', x_type = 'time'))

summary(TestFit)
}
