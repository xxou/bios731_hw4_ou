# ************************************
#           Homework 4
# ************************************
#  Quantile regression
#   my_rq
# ************************************

my_rq <- function(Y, X, tau) {
  n <- length(Y)
  p <- dim(X)[2]
  
  # Objective function 
  # [0, 0, tau, 1 - tau] 
  # [b+, b-, u, v]
  f.obj <- c(rep(0, 2*p), rep(tau, n), rep(1 - tau, n))
  
  # Constraints: 
  # [X, -X, I, -I]
  f.con <- cbind(X, -X, diag(n), -diag(n))
  f.dir <- rep("=", n)
  f.rhs <- Y
  
  # Solve LP
  sol <- lpSolve::lp("min", f.obj, f.con, f.dir, f.rhs)
  beta_plus <- sol$solution[1:p]
  beta_minus <- sol$solution[(p + 1):(2 * p)]
  beta_hat <- beta_plus - beta_minus
  
  return(beta_hat)  # return only coefficients
}
