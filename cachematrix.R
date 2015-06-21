## Put comments here that give an overall description of what your
## functions do
## makeCacheMatrix function creates a special matrix and sets the inverse of matrix in an environment variable for caching.
## cacheSolve function gets the inverse of a matrix from cache if exists otherwise calculates the inverse and passes the inverse of amatrix to makeChacheMatrix to store it in the cache.
## Order of Execution is - first execute makeCacheMatrix() and assign return value to x,m<- matrix(c(-1,-2,1,1),2,2) x<- makeCacheMatrix(m) 
## pass x to cacheSolve function - cacheSolve(x)


## Write a short comment describing this function
## Below function takes a matrxi variable , set resets the matrix from previous values. get gives the matrix from 
## envronment . setInvMatrix sets inverse matrix in cache(Environment Variable)
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInvMatrix <- function(invmatrix) inv <<- invmatrix
  getInvMatrix <- function() inv
  list(set = set, get = get,
       setInvMatrix = setInvMatrix,
       getInvMatrix = getInvMatrix)

}


## Write a short comment describing this function
## below fucntion takes matrix x from the environment , x gets value by the output from above function.
## variable inv stores inverse matrix either from cache or by calculating the value

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
	inv <- x$getInvMatrix()
  	if(!is.null(inv)) {
    	message("getting cached data")
    	return(inv)
  	}
  data <- x$get()
  inv <- solve(data)
  x$setInvMatrix(inv)
  inv
}
