## Below functions are used to create a special "matrix" object and cache the inverse of matrix

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv_mat <- NULL

set <- function(y) {
    x <<- y
    inv_mat <<- NULL
}

get <- function() x

setinverse <- function(inverse) inv_mat <<- inverse

getinverse <- function() inv_mat

list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed)
## then the cachesolve would retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
inv_mat <- x$getinverse()

if(!is.null(inv_mat)) {
  message("getting cached data")
  return(inv_mat)
}

data <- x$get()
inv_mat <- solve(data, ...)
x$setinverse(inv_mat)
inv_mat

}
