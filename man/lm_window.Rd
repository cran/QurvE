% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/linear_fits.R
\name{lm_parms}
\alias{lm_parms}
\alias{lm_window}
\title{Helper functions for handling linear fits.}
\usage{
lm_parms(m)

lm_window(x, y, i0, h = 5)
}
\arguments{
\item{m}{linear model (\code{lm}) object}

\item{x}{vector of independent variable (e.g. time).}

\item{y}{vector of dependent variable (concentration of organisms).}

\item{i0}{index of first value used for a window.}

\item{h}{with of the window (number of data).}
}
\value{
linear model object of class \code{lm} (lm_window)
resp. vector with parameters of the fit (lm_parms).
}
\description{
\code{lm_window} performs a linear regression with the Theil-Sen estimator on a subset of data.
}
\examples{
# Create random growth dataset
rnd.dataset <- rdm.data(d = 35, mu = 0.8, A = 5, label = "Test1")

# Extract time and growth data for single sample
time <- rnd.dataset$time[1,]
data <- as.numeric(rnd.dataset$data[1,-(1:3)]) # Remove identifier columns
data.log <- log(data/data[1])

# Perform linear fit on 8th window of size 8
linreg <- lm_window(time, data.log, 8, h=8)

summary(linreg)

lm_parms(linreg)
}
\references{
Hall, B. G., H. Acar and M. Barlow 2013. Growth Rates Made Easy.
Mol. Biol. Evol. 31: 232-238 \doi{10.1093/molbev/mst197}
}
