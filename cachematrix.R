
## This pair of functions cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse
## This function 1) Sets the value of the matrix, 2) Get the value of the matrix
## 3) Sets the value of the inverse, and 4) Gets the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
      set <- function(y) {
        x <<- y
        inv <<- NULL
      }
      get <- function() x
      setinv <- function(solveMatrix) inv <<- inverse
      getinv <- function() inv
      list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cachesolve should retrieve the inverse from 
## the cache.

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv)) {
      message("getting cached data")
      return(inv)
    }
    data <- x$get()
    inv <- solve (data, ...)
    x$setinv(inv)
    inv
}
