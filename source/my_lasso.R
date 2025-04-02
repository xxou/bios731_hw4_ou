# ****************************************
#           Homework 4
# ****************************************
#  quadratic programming problem for LASSO
#  my_lasso
# ****************************************

my_lasso <- function(Y, X, lambda) {
  n <- nrow(X)
  p <- ncol(X)
  
  # tilde X = [X, -X]
  # n x 2p matrix
  X_tilde <- cbind(X, -X)  
  
  # Dmat = t(X_tilde) %*% X_tilde, must be symmetric
  Vmat <- t(X_tilde) %*% X_tilde
  
  # dvec = - t(X_tilde) %*% Y
  dvec <- - t(X_tilde) %*% Y
  
  # Amat: constraint matrix
  # 1. All variables >= 0 (identity matrix of size 2p)
  # 2. L1 norm constraint: sum(beta^+ + beta^-) <= lambda
  
  tAmat <- matrix(1, 2*p, nr = 1)  
  bvec <- lambda
  uvec <- rep(100, 2*p)
  
  # Solve using LowRankQP
  Solve <- LowRankQP::LowRankQP(Vmat, dvec, tAmat, bvec, uvec = uvec)
  
  # Extract 
  beta_plus <- Solve$alpha[1:p]
  beta_minus <- Solve$alpha[(p + 1):(2 * p)]
  beta_hat <- beta_plus - beta_minus
  
  return(beta_hat)
}
