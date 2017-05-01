# Calculate sum of squares of x

x <- 1:10

# Do this instead! sum(x^2)

sum_of_squares <- function(x) {
  # 1) Set up the state
  so_far <- 0
  # 2) Loop
  for (j in 1:length(x)) {
    ##    Change the state
    so_far <- so_far + x[j]^2
  }
  # 3) Package up the state for output
  so_far
}

# Find the minimum of a set x

# Remember: Use min(x)

my_min <- function(x) {
  #1) Set up the state
  so_far <- Inf
  #2) Look
  for (j in 1:length(x)) {
    #     Modify the state

    if(x[j] < so_far) {
      so_far <- x[j]
    }
  }
  #3) package up state for output
  so_far

}


# Sample k values out of the set 1:n
pick_k_replace <- function(n, k) {
  result <- numeric(k)
  for (j in 1:k)
    result[j] <- ceiling(runif(1, 1, n))

  result
}


pick_k <- function(n, k) {
  if (k > n) stop("Can't sample more than n elements without replacement")

  result <- numeric(k)
  set_to_choose_from <- 1:n
  for (j  in  1:k) {
    proposal <-
      set_to_choose_from[ceiling(runif(1, 0, length(set_to_choose_from)))]
    result[j] <- proposal
    set_to_choose_from <-
      set_to_choose_from[set_to_choose_from !=proposal ]
  }

  # package up accumulator
  result
}

## Resampling

resample <- function(data) {
  n <- nrow(data)
  inds <- pick_k_replace(n, n)

  data[inds, ]
}


samp_without_replacement <- function(x, n) {
  if (k > n) stop("Can't sample more than n elements without replacement")
  x[order(runif(length(x)))[1:k]]
}



samp <- function(x, ...) {
  useMethod("samp")
}


our_bootstrap <- function(stat, ntrials = 3,data){
  so_far = numeric(ntrials)
  for (j in 1:ntrials){
    newdata <- data[pick_k_replace(nrow(data), nrow(data)), ]
    so_far[j] <- stat(newdata)
  }

  so_for

}







