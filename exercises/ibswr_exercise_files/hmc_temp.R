
# simple HMC function
# n_its is the number of iterations
# start_x the initial position
# L is the number of steps of numerical propagation
# under the Hamiltionian H = U + rho^2/2, U = -log(target_density)
# epsilon is the size of the steps
basicHMC <- function(n_its = 1e2, start_x = 0, L = 10, epsilon = 0.1, ...) {
  xs <- rep(NA, n_its) # to store all the sampled values
  x <- start_x # starting point
  xs[1] <- x # first value
  U_x <- U_fn(x, ...) # log density and gradient at current x
  for (ii in 2:n_its) { # HMC iterations
    rho <- rnorm(1) # normal sample (we could define scheme with different sd)
    x_prop <- x 
    # Leapfrog method to propagate under Hamiltonian: 
    rho_prop <- rho - epsilon/2*U_x$grad # half step for momentum
    for (j in 1:L) {
      x_prop <- x_prop + epsilon*rho_prop # position update 
      U_prop <- U_fn(x_prop, ...) # update gradient
      # update momentum, with a half step at the end
      rho_prop <- rho_prop - epsilon*U_prop$grad/(1 + (j==L))
    }
    MH_prob <- exp(U_x$U + rho^2/2 - U_prop$U - rho_prop^2/2)
    if (runif(1) < MH_prob) { # MH acceptance probability
      x <- x_prop # accept move
      U_x <- U_prop # update density
    }
    xs[ii] <- x # store current position, even when move rejected
  }
  return(xs)
}

target_density <- function(x, nu, grad = FALSE) {
  dens <- dt(x, nu) # student-t density
  if (grad) { # return density and gradient
    grad <- -(nu + 1)/(nu + x^2)*x*dens
    return(list(dens = dens, grad = grad))
  } else { # return just the density
    return(dens)
  }
}

U_fn <- function(x, ...) {
  p_x <- target_density(x, ..., grad = TRUE)
  U <- -log(p_x$dens)
  grad <- -1/p_x$dens*p_x$grad
  return(list(U = U, grad = grad))
}

