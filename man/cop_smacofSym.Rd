% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cop_smacofSym.R
\name{cop_smacofSym}
\alias{cop_smacofSym}
\title{PCOPS versions of smacofSym models}
\usage{
cop_smacofSym(
  dis,
  theta = 1,
  type = "ratio",
  ndim = 2,
  weightmat = 1 - diag(nrow(dis)),
  init = NULL,
  itmaxi = 1000,
  ...,
  stressweight = 1,
  cordweight = 0.5,
  q = 1,
  minpts = ndim + 1,
  epsilon = 10,
  rang = NULL,
  verbose = 0,
  normed = TRUE,
  scale = "sd",
  stresstype = "default"
)
}
\arguments{
\item{dis}{numeric matrix or dist object of a matrix of proximities}

\item{theta}{the theta vector; should be a scalar for the lambda (proximity) transformation. Defaults to 1.}

\item{type}{MDS type.}

\item{ndim}{number of dimensions of the target space}

\item{weightmat}{(optional) a matrix of nonnegative weights}

\item{init}{(optional) initial configuration}

\item{itmaxi}{number of iterations. default is 1000}

\item{...}{additional arguments to be passed to the fitting procedure}

\item{stressweight}{weight to be used for the fit measure; defaults to 1}

\item{cordweight}{weight to be used for the cordillera; defaults to 0.5}

\item{q}{the norm of the cordillera; defaults to 1}

\item{minpts}{the minimum points to make up a cluster in OPTICS; defaults to ndim+1}

\item{epsilon}{the epsilon parameter of OPTICS, the neighbourhood that is checked; defaults to 10}

\item{rang}{range of the distances (min distance minus max distance). If NULL (default) the cordillera will be normed to each configuration's maximum distance, so an absolute value of goodness-of-clusteredness.}

\item{verbose}{numeric value hat prints information on the fitting process; >2 is extremely verbose}

\item{normed}{should the cordillera be normed; defaults to TRUE}

\item{scale}{should the configuration be scale adjusted}

\item{stresstype}{which stress to report. Only takes smacofs default stress currrently.}
}
\value{
A list with the components
   \itemize{
        \item{stress:} the stress
        \item{stress.m:} default normalized stress
        \item{copstress:} the weighted loss value
        \item{OC:} the Optics cordillera value
        \item{parameters:} the parameters used for fitting (lambda)
        \item{fit:} the returned object of the fitting procedure 
        \item{cordillera:} the cordillera object
}
}
\description{
The free parameter is lambda for power transformations the observed proximities. The fitted distances power is internally fixed to 1 and the power for the weights is 1.
}
\keyword{multivariate}
