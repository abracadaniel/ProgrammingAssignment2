## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  # object for holding the inverse matrix
  cachedInverse <- NULL
  
  # set the matrix and reset the cached Inverse
  set <- function(y) {
    x <<-  y
    cachedInverse <<- NULL
  }
  
  # get the matrix
  get <- function() {
    x
  }
  
  # set the inverse matrix
  setInverse <- function(inverseMatrix) {
    cachedInverse <<- inverseMatrix
  }
  
  # get the inverse matrix
  getInverse <- function() {
    cachedInverse
  }
  
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function
# This function tries to get the inverseMatrix from the object
# if it has a cached inverseMatrix it returns that
# else it calculates the inverseMatrix and caches it in the objectdiag()
cacheSolve <- function(x, ...) {
  inverseMatrix <- x$getInverse()
  
  if (!is.null(inverseMatrix)) {
    # if the object contains an inverseMatrix, we can return that
    message("getting cached inverseMatrix")
  } else {
    # get the matrix from the x object
    matrix <- x$get()
    
    # inverse the matrix
    inverseMatrix = solve(matrix, ...)
    
    # cache the calculated inverseMatrix
    x$setInverse(inverseMatrix)
  }
  
  inverseMatrix
}
