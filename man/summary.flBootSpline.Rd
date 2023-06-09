% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fluorescence_summaries.R
\name{summary.flBootSpline}
\alias{summary.flBootSpline}
\title{Generic summary function for flBootSpline objects}
\usage{
\method{summary}{flBootSpline}(object, ...)
}
\arguments{
\item{object}{object of class \code{flBootSpline}}

\item{...}{Additional arguments. This has currently no effect and is only meant to fulfill the requirements of a generic function.}
}
\value{
A dataframe with statistical parameters extracted from a dose-response bootstrapping analysis.
}
\description{
Generic summary function for flBootSpline objects
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
TestFit <- flBootSpline(time = time,
                       fl_data = data,
                       ID = 'TestFit',
                       control = fl.control(fit.opt = 's', x_type = 'time',
                       nboot.fl = 50))

summary(TestFit)
}
