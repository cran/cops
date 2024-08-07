% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ljoptim.R
\name{ljoptim}
\alias{ljoptim}
\title{(Adaptive) Version of Luus-Jakola Optimization}
\usage{
ljoptim(
  x,
  fun,
  ...,
  red = ifelse(adaptive, 0.99, 0.95),
  lower,
  upper,
  acc = 1e-06,
  accd = 1e-04,
  itmax = 1000,
  verbose = 0,
  adaptive = TRUE
)
}
\arguments{
\item{x}{optional starting values}

\item{fun}{function to minimize}

\item{...}{additional arguments to be passed to the function to be optimized}

\item{red}{value of the reduction of the search region}

\item{lower}{The lower contraints of the search region}

\item{upper}{The upper contraints of the search region}

\item{acc}{if the numerical accuracy of two successive target function values is below this, stop the optimization; defaults to 1e-6}

\item{accd}{if the width of the search space is below this, stop the optimization; defaults to 1e-4}

\item{itmax}{maximum number of iterations}

\item{verbose}{numeric value hat prints information on the fitting process; >2 is extremely verbose}

\item{adaptive}{should the adaptive version be used? defaults to TRUE.}
}
\value{
A list with the components (see also \code{\link[stats]{optim}})
\itemize{
     \item par The position of the optimimum in the search space (parameters that minimize the function; argmin fun)
     \item value The value of the objective function at the optimum (min fun)
     \item counts The number of iterations performed at convergence with entries fnction for the number of iterations and gradient which is always NA at the moment
     \item convergence 0 successful completion by the accd or acc criterion, 1 indicate iteration limit was reached, 99 is a problem 
     \item message is NULL (only for compatibility or future use)
}
}
\description{
Adaptive means that the search space reduction factors in the number of iterations; makes convergence faster at about 100 iterations
}
\examples{
fbana <- function(x) {
x1 <- x[1]
x2 <- x[2]
100 * (x2 - x1 * x1)^2 + (1 - x1)^2
}
res1<-ljoptim(c(-1.2,1),fbana,lower=-5,upper=5,accd=1e-16,acc=1e-16)
res1

set.seed(210485)
fwild <- function (x) 10*sin(0.3*x)*sin(1.3*x^2) + 0.00001*x^4 + 0.2*x+80
plot(fwild, -50, 50, n = 1000, main = "ljoptim() minimising 'wild function'")
res2<-ljoptim(50, fwild,lower=-50,upper=50,adaptive=FALSE,accd=1e-16,acc=1e-16)
points(res2$par,res2$value,col="red",pch=19)
res2

}
