## Put comments here that give an overall description of what your functions do

## Matrix inversion is usually a costly computation. Caching the inverse of a matrix, 
## rather than computing it repeatedly, is of benefit. The functions below are 
## designed for this purpose. 

## Write a short comment describing this function

## The makeCacheMatrix function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

## The cacheSolve function computes the inverse of the special "matrix" returned by makeCacheMatrix. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
    m <- x$get()
    i <- inverse(m, ...)
    x$setinverse(i)
    i
  }

 
