\name{baltimore}
\alias{baltimore}
\docType{data}
\title{House sales prices, Baltimore, MD 1978}
\description{
  House sales price and characteristics for a spatial hedonic regression, Baltimore, MD 1978. X,Y on Maryland grid, projection type unknown.
}
\usage{data(baltimore)}
\format{
  A data frame with 211 observations on the following 17 variables.
  \describe{
    \item{STATION}{a numeric vector}
    \item{PRICE}{a numeric vector}
    \item{NROOM}{a numeric vector}
    \item{DWELL}{a numeric vector}
    \item{NBATH}{a numeric vector}
    \item{PATIO}{a numeric vector}
    \item{FIREPL}{a numeric vector}
    \item{AC}{a numeric vector}
    \item{BMENT}{a numeric vector}
    \item{NSTOR}{a numeric vector}
    \item{GAR}{a numeric vector}
    \item{AGE}{a numeric vector}
    \item{CITCOU}{a numeric vector}
    \item{LOTSZ}{a numeric vector}
    \item{SQFT}{a numeric vector}
    \item{X}{a numeric vector}
    \item{Y}{a numeric vector}
  }
}

\source{Prepared by Luc Anselin. Original data made available by Robin Dubin, Weatherhead School of Management, Case Western Research University, Cleveland, OH.
\url{https://spatial.uchicago.edu/sample-data}}

\references{
Dubin, Robin A. (1992). Spatial autocorrelation and neighborhood quality. Regional Science and Urban Economics 22(3), 433-452.
}

\examples{
data(baltimore)
## maybe str(baltimore) ; plot(baltimore) ...
}
\keyword{datasets}
