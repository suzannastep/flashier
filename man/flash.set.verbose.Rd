% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flash_set_verbose.R
\name{flash.set.verbose}
\alias{flash.set.verbose}
\title{Set verbose output}
\usage{
flash.set.verbose(
  flash,
  verbose = 1L,
  disp.fns = NULL,
  colnames = NULL,
  colwidths = NULL
)
}
\arguments{
\item{flash}{A \code{flash} or \code{flash.fit} object.}

\item{verbose}{When and how to display progress updates. Set to \code{0}
  for no updates; \code{1} for updates after a "greedy" factor is added or
  a backfit is completed; \code{2} for additional notifications about the
  variational lower bound (ELBO); and \code{3} for updates after every
  iteration. By default, per-iteration update information includes the
  change in ELBO and the maximum (absolute) change over all L2-normalized
  loadings \eqn{\ell_1, \ldots, \ell_K} and factors \eqn{f_1, \ldots, f_K}.
  Update information is customizable via parameters \code{disp.fns},
  \code{colnames}, and \code{colwidths}.

A single tab-delimited table of values may also be output using
  option \code{verbose = -1}. This format is especially convenient for
  downstream analysis of the fitting history (for example, it may be used
  to plot the value of the ELBO after each iteration).}

\item{disp.fns}{A vector of functions. Used to calculate values to display
after each greedy/backfit iteration when \code{verbose} is either -1 or 3.
Options include \code{\link{display.elbo}},
\code{\link{display.elbo.diff}}, \code{\link{display.max.chg}},
\code{\link{display.L.max.chg}}, and \code{\link{display.F.max.chg}}.
Custom functions may also be used. They should accept three parameters,
\code{new}, \code{old}, and \code{k}, where \code{new} refers to the
\code{\link{flash.fit}} object from the current iteration, \code{old}
refers to the \code{flash.fit} object from the previous iteration,
and \code{k} identifies the factor/loadings pair that is currently
being updated during sequential backfits (that is, in calls to function
\code{\link{flash.backfit}} where \code{extrapolate = FALSE}). See below
for an example.}

\item{colnames}{A vector of column names, one for each function in
\code{disp.fns}.}

\item{colwidths}{A vector of column widths, one for each function in
\code{disp.fns}.}
}
\value{
A \code{\link{flash}} object.
}
\description{
Determines the output that will be displayed when fitting a \code{flash}
  object.
}
\examples{
data(gtex)

# Suppress all verbose output.
fl <- flash.init(gtex) \%>\%
  flash.set.verbose(0) \%>\%
  flash.add.greedy(Kmax = 5L)

# Set custom verbose output.
sparsity.F <- function(new, old, k) {
  g.F <- ff.g(new, k, n = 2)
  g.F.pi0 <- g.F$pi[1] # Mixture weight of the "null" component.
  return(g.F.pi0)
}
disp.fns <- c(display.elbo, display.F.max.chg, sparsity.F)
colnames <- c("ELBO", "Max Chg (Tiss)", "Sparsity (Tiss)")
colwidths <- c(12, 18, 18)
fl <- flash.init(gtex) \%>\%
  flash.set.verbose(
    3L,
    disp.fns = disp.fns,
    colnames = colnames,
    colwidths = colwidths
  ) \%>\%
  flash.add.greedy(Kmax = 3L)

# Output can be changed as needed.
fl <- flash.init(gtex) \%>\%
  flash.set.verbose(verbose = 1) \%>\%
  flash.add.greedy(Kmax = 5L) \%>\%
  flash.backfit(verbose = 3) \%>\%
  flash.add.greedy(Kmax = 1L)

}
\seealso{
\code{\link{display.elbo}}, \code{\link{display.elbo.diff}},
  \code{\link{display.max.chg}}, \code{\link{display.L.max.chg}},
  \code{\link{display.F.max.chg}}
}
