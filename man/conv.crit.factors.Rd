% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convergence_criteria.R
\name{conv.crit.factors}
\alias{conv.crit.factors}
\title{Calculate the maximum absolute difference in scaled factors}
\usage{
conv.crit.factors(new, old, k)
}
\arguments{
\item{new}{The \code{flash.fit} object from the current iteration.}

\item{old}{The \code{flash.fit} object from the previous iteration.}

\item{k}{Ignored.}
}
\description{
An alternative objective function that can be used to determine
  convergence when fitting a \code{\link{flash}} object. Calculates the
  maximum absolute difference in the L2-normalized factors,
  \eqn{\max_{j, k} | \frac{f_jk^{new}}{\| f_jk^{new} \|_2} -
  \frac{f_jk^{old}}{\| f_jk^{old} \|_2} |}.
}
\seealso{
\code{\link{conv.crit.elbo}}, \code{\link{conv.crit.loadings}}
}
