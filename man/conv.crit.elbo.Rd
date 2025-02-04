% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convergence_criteria.R
\name{conv.crit.elbo}
\alias{conv.crit.elbo}
\title{Calculate the difference in ELBO}
\usage{
conv.crit.elbo(new, old, k)
}
\arguments{
\item{new}{The \code{flash.fit} object from the current iteration.}

\item{old}{The \code{flash.fit} object from the previous iteration.}

\item{k}{Ignored.}
}
\description{
The default objective function used to determine convergence when fitting
  a \code{\link{flash}} object. Calculates the difference in the
  variational lower bound from one iteration to the next.
}
\seealso{
\code{\link{conv.crit.loadings}}, \code{\link{conv.crit.factors}}
}
