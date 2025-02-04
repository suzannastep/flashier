% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flash_init.R
\name{flash.init}
\alias{flash.init}
\title{Initialize flash object}
\usage{
flash.init(data, S = NULL, var.type = 0L, S.dim = NULL)
}
\arguments{
\item{data}{The observations. Usually a matrix, but can also be a sparse
matrix of class \code{Matrix} or a low-rank matrix
representation as returned by, for example, \code{\link{svd}},
\code{\link[irlba]{irlba}}, \code{\link[rsvd]{rsvd}}, or
\code{\link[softImpute]{softImpute}} (in general, any list object that
includes fields \code{u}, \code{d}, and \code{v} will be interpreted
as a low-rank matrix representation).}

\item{S}{The standard errors. Can be \code{NULL} (in which case all residual
variance will be estimated) or a matrix, vector, or scalar. \code{S}
should be a scalar if standard errors are identical across observations. It
should be a vector if standard errors either vary across columns but are
constant within any given row, or vary across rows and are constant within
any given column (\code{flash} will use the length of the vector
to determine whether the supplied values correspond to rows or columns; if the
data matrix is square, then the sense must be specified using parameter
\code{S.dim} in function \code{\link{flash.init}}).}

\item{var.type}{Describes the structure of the estimated residual variance.
  Can be \code{NULL}, \code{0}, \code{1}, \code{2}, or \code{c(1, 2)}. If
  \code{NULL}, then \code{S} accounts for all residual variance. If
  \code{var.type = 0}, then the estimated residual variance (which is added
  to any variance given by \code{S}) is assumed to be constant
  across all observations. Setting \code{var.type = 1} estimates a single
  variance parameter for each row; \code{var.type = 2} estimates one
  parameter for each column; and \code{var.type = c(1, 2)} optimizes over
  all rank-one matrices (that is, it assumes that the residual variance
  parameter \eqn{s_{ij}} can be written \eqn{s_{ij} = a_i b_j}, where the
  \eqn{n}-vector \eqn{a} and the \eqn{p}-vector \eqn{b} are to be
  estimated).

  Note that if any portion of the residual variance is to be estimated, then
  it is usually faster to set \code{S = NULL} and to let \code{flash}
  estimate all of the residual variance. Further, \code{var.type = c(1, 2)}
  is much slower than all other options, so it should be used with care.}

\item{S.dim}{The dimension along which \code{S} lies when \code{S} is a
vector. If \code{S.dim = 1}, then \code{S} will be interpreted as giving
standard errors that vary across rows but are constant within any given
column; if \code{S.dim = 2}, then it will be interpreted as giving
standard errors that vary across columns but are constant within any
given row. It is only necessary to specify \code{S.dim} when it cannot
be inferred from the data (i.e., when \code{data} is a square matrix).}
}
\value{
A \code{\link{flash}} object.
}
\description{
Sets up a \code{flash} object with no factors. Since all other
\code{flash.xxx} functions take a \code{flash} or \code{flash.fit} object
as their first argument, calling \code{flash.init} should be the first step
in any \code{flash} pipeline.
}
