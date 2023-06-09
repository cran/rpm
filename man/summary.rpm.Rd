% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary.rpm.R
\name{summary.rpm}
\alias{summary.rpm}
\alias{print.summary.rpm}
\title{Summarizing rpm Model Fits}
\usage{
\method{summary}{rpm}(
  object,
  ...,
  digits = max(3, getOption("digits") - 3),
  correlation = FALSE,
  covariance = FALSE,
  include.single = TRUE
)

\method{print}{summary.rpm}(
  x,
  digits = max(3, getOption("digits") - 3),
  correlation = FALSE,
  covariance = FALSE,
  signif.stars = getOption("show.signif.stars"),
  eps.Pvalue = 1e-04,
  print.header = TRUE,
  print.formula = FALSE,
  print.fitinfo = TRUE,
  print.coefmat = TRUE,
  print.message = TRUE,
  print.deviances = TRUE,
  print.drop = TRUE,
  ...
)
}
\arguments{
\item{object}{an object of class \code{\link{rpm}}, usually, a result of a call to
[rpm()].}

\item{...}{For [summary.rpm()] additional arguments are passed to
[logLik.rpm()]. For [print.summary.rpm()], to [stats::printCoefmat()].}

\item{digits}{significant digits for coefficients. The default is max(3, getOption("digits")-3).}

\item{correlation}{logical whether the correlation matrix of the estimated parameters
should be printed (T or F); default=FALSE}

\item{covariance}{logical whether the covariance matrix of the estimated parameters
should be printed (T or F); default=FALSE}

\item{include.single}{logical; if `TRUE`, include in the summary table the 
coefficients of the log-odds of being single for each category of women and men.}

\item{x}{object of class `summary.rpm` returned by [summary.rpm()].}

\item{signif.stars}{whether to print dots and stars to signify
statistical significance. See [print.summary.lm()].}

\item{eps.Pvalue}{\eqn{p}-values below this level will be printed
as "<`eps.Pvalue`".}

\item{print.formula, print.fitinfo, print.coefmat, print.message, print.deviances, print.drop, print.header}{which components of the fit summary to print.}
}
\value{
The function [summary.rpm()] computes and returns a list of summary
  statistics of the fitted [rpm()] model given in `object`. Note that for
  backwards compatibility, it returns the coefficient table.

  The returned object is a list of class "summary.rpm" with the following
  elements:
  
\item{formula}{ERGM model formula}
\item{digits}{the 'digits' inputted to <summary.rpm> or the default value (despite the fact the digits will be 5)}
\item{correlation, covariance}{whether to print correlation/covariance matrices of the estimated parameters}
\item{iterations}{object$iterations}
\item{control}{the [control.rpm()] object used}
\item{samplesize}{MCMC sample size}
\item{message}{optional message on the validity of the standard error estimates}
\item{aic.null,bic.null}{values of AIC and BIC for the null model}
\item{aic, bic}{values of AIC and BIC}
\item{coefficients}{data frames with model parameters and associated statistics}
\item{asycov}{asymptotic covariance matrix}
\item{asyse}{asymptotic standard error matrix}
\item{offset, drop, estimate, iterations, mle.lik, null.lik}{
see documentation of the object returned by [rpm()]
}
}
\description{
[base::summary()] method for [rpm()] fits.
}
\details{
[summary.rpm()] tries to be smart about formatting the
coefficients, standard errors, etc.

The default printout of the summary object contains the
  call, number of iterations used, null and residual deviances, and
  the values of AIC and BIC.
  The coefficient table contains the following
  columns:
  
  - `Estimate`, `Std. Error` - parameter estimates and their standard errors
  - `z value`, `Pr(>|z|)` - z-test and p-values
}
\examples{
library(rpm)
data(fauxmatching)
\donttest{
fit <- rpm(~match("edu") + WtoM_diff("edu",3),
          Xdata=fauxmatching$Xdata, Zdata=fauxmatching$Zdata,
          X_w="X_w", Z_w="Z_w",
          pair_w="pair_w", pair_id="pair_id", Xid="pid", Zid="pid",
          sampled="sampled",sampling_design="stock-flow")
summary(fit)
}
}
\seealso{
The model fitting function [rpm()], [print.rpm()], and
  [base::summary()]. Function [stats::coef()] will extract the data frame of
  coefficients with standard errors, t-statistics and p-values.
}
\keyword{models}
\keyword{regression}
