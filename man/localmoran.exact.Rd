\name{localmoran.exact}
\alias{localmoran.exact}
\alias{localmoran.exact.alt}
\alias{print.localmoranex}
\alias{as.data.frame.localmoranex}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Exact local Moran's Ii tests}
\description{
 \code{localmoran.exact} provides exact local Moran's Ii tests under the null hypothesis, while \code{localmoran.exact.alt} provides exact local Moran's Ii tests under the alternative hypothesis. In this case, the model may be a fitted model returned by \code{errorsarlm} from which the covariance matrix is retrieved, or the covariance matrix can be passed through the \code{Omega=} argument.
}
\usage{
localmoran.exact(model, select, nb, glist = NULL, style = "W", zero.policy = FALSE, alternative = "greater", spChk = NULL, resfun = weighted.residuals, save.Vi = FALSE)
localmoran.exact.alt(model, select, nb, glist = NULL, style = "W", zero.policy = FALSE, alternative = "greater", spChk = NULL, resfun = weighted.residuals, Omega = NULL, save.Vi = FALSE, save.M = FALSE)
\method{print}{localmoranex}(x, \dots)
\method{as.data.frame}{localmoranex}(x, row.names=NULL, optional=FALSE, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{an object of class \code{lm} returned by \code{lm} (assuming no global spatial autocorrelation), or an object of class \code{sarlm} returned by a spatial simultaneous autoregressive model fit (assuming global spatial autocorrelation represented by the model spatial coefficient); weights may be specified in the \code{lm} fit, but offsets should not be used}
  \item{select}{an integer vector of the id. numbers of zones to be tested; if missing, all zones}
  \item{nb}{a list of neighbours of class \code{nb}}
  \item{glist}{a list of general weights corresponding to neighbours}
  \item{style}{can take values W, B, C, and S}
  \item{zero.policy}{if TRUE assign zero to the lagged value of zones without
neighbours, if FALSE assign NA}
  \item{alternative}{a character string specifying the alternative hypothesis,
must be one of greater (default), less or two.sided.}
  \item{spChk}{should the data vector names be checked against the spatial objects for identity integrity, TRUE, or FALSE, default NULL to use \code{get.spChkOption()}}
  \item{resfun}{default: weighted.residuals; the function to be used to extract residuals from the \code{lm} object, may be \code{residuals}, \code{weighted.residuals}, \code{rstandard}, or \code{rstudent}}
  \item{Omega}{External covariance matrix}
  \item{save.Vi}{if TRUE, return the star-shaped weights lists for each zone 
tested}
  \item{save.M}{if TRUE, save a list of left and right M products}
  \item{x}{object to be printed}
  \item{row.names}{ignored argument to \code{as.data.frame.localmoranex};
row names assigned from localmoranex object}
  \item{optional}{ignored argument to \code{as.data.frame.localmoranex};
row names assigned from localmoranex object}
  \item{\dots}{arguments to be passed through}
}

\value{
A list with class \code{localmoranex} containing "select" lists, each with
 class \code{moranex} with the following components:
  \item{statistic}{the value of the saddlepoint approximation of the
 standard deviate of global Moran's I.}
  \item{p.value}{the p-value of the test.}
  \item{estimate}{the value of the observed global Moran's I.}
  \item{method}{a character string giving the method used.}
  \item{alternative}{a character string describing the alternative hypothesis.}
  \item{gamma}{eigenvalues (two extreme values for null, vector for alternative)}
  \item{data.name}{a character string giving the name(s) of the data.}
  \item{df}{degrees of freedom}
  \item{i}{zone tested}
  \item{Vi}{zone tested}

When the alternative is being tested, a list of left and right M products in attribute M.
}
\author{Markus Reder and Roger Bivand}

\seealso{\code{\link{lm.morantest.exact}}, \code{\link{localmoran.sad}}}
\examples{
eire <- readShapePoly(system.file("etc/shapes/eire.shp", package="spdep")[1],
  ID="names", proj4string=CRS("+proj=utm +zone=30 +units=km"))
eire.nb <- poly2nb(eire)
#data(eire)
e.lm <- lm(OWNCONS ~ ROADACC, data=eire)
localmoran.sad(e.lm, nb=eire.nb)
localmoran.exact(e.lm, nb=eire.nb)
e.errorsar <- errorsarlm(OWNCONS ~ ROADACC, data=eire, listw=nb2listw(eire.nb))
localmoran.exact.alt(e.errorsar, nb=eire.nb)
Omega <- invIrW(nb2listw(eire.nb), rho=0.6)
Omega1 <- 9*tcrossprod(Omega)
localmoran.exact.alt(e.errorsar, nb=eire.nb, Omega=Omega1)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{spatial}
