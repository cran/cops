#' MDS Bootstrap for pcops objects
#'
#' Performs a bootstrap on an MDS solution. It works for derived dissimilarities only, i.e. generated by the call dist(data). The original data matrix needs to be provided, as well as the type of dissimilarity measure used to compute the input dissimilarities.
#'
#' @param object  Object of class smacofP if used as method or another object inheriting from smacofB (needs to be called directly as bootmds.smacofP then).
#' @param data Initial data (before dissimilarity computation).
#' @param method.dat Dissimilarity computation used as MDS input. This must be one of "pearson", "spearman", "kendall", "euclidean", "maximum", "manhattan", "canberra", "binary".
#' @param nrep Number of bootstrap replications.
#' @param alpha Alpha level for condfidence ellipsoids.
#' @param verbose If 'TRUE', bootstrap index is printed out.
#' @param  ...  Additional arguments needed for dissimilarity computation as specified in \code{\link[smacof]{sim2diss}}.
#'
#' @details In order to examine the stability solution of an MDS, a bootstrap on the raw data can be performed. This results in confidence ellipses in the configuration plot. The ellipses are returned as list which allows users to produce (and further customize) the plot by hand. See \code{\link[smacof]{bootmds}} for more. 
#'
#' @return An object of class 'smacofboot', see \code{\link[smacof]{bootmds}}. With values 
#' \itemize{
#' \item cov: Covariances for ellipse computation
#' \item bootconf: Configurations bootstrap samples
#' \item stressvec: Bootstrap stress values
#' \item bootci: Stress bootstrap percentile confidence interval
#' \item spp: Stress per point (based on stress.en) 
#' \item stab: Stability coefficient
#' }
#'
#'
#' @importFrom smacof bootmds
#' @examples
#' dats <- na.omit(PVQ40[,1:5])
#' diss <- dist(t(dats))   ## Euclidean distances 
#' fit <- pcops(diss,loss="rstress",itmaxi=50) #this is just for illustration: increase itmaxi    
#' set.seed(123)
#' resboot <- bootmds(fit, dats, method.dat = "euclidean", nrep = 2)
#' @export
bootmds.pcops<- function(object, data, method.dat = "pearson", nrep = 100, alpha = 0.05, 
                            verbose = FALSE, ...) 
{   
    calli <- match.call()
    ocall <- object$fit$call
    ocall$type <- object$fit$type
    ocall$weightmat <- object$fit$weightmat
    ocall$init <- object$fit$init
    ocall$ndim <- object$fit$ndim
    if(!is.numeric(ocall$itmax)) ocall$itmax <- object$fit$niter+1000 else ocall$itmax <- object$fit$call$itmax
    object$fit$call <- ocall
    out <- smacof::bootmds(object$fit,data=data,method.dat=method.dat,nrep=nrep,alpha=alpha,verbose=verbose,...)
    out$call <- calli
    out
}
