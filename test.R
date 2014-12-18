source("cachematrix.R")

m <- matrix(rnorm(9, 10), ncol = 3, nrow = 3)
x <- makeCacheMatrix(m)
print(cacheSolve(x))
print(solve(m))
# They return the same matrix! YAY