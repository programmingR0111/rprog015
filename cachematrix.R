##Thanks to vkatsikaros (rpog-assignment-2) - I did not author this code.
## makeCacheMatrix is a function that returns a list of functions
## to store a matrix and a cached value of the inverse of the 
## matrix. Contains the following functions:
## * setMatrix      set the value of a matrix
## * getMatrix      get the value of a matrix
## * cacheInverse   get the cahced value (inverse of the matrix)
## * getInverse     get the cahced value (inverse of the matrix)
 
## creates variable X not reachable from global environment. X is only available in makeCacheMatrix environment.
 
makeCacheMatrix <- function(x = numeric()) {
        
        # holds the cached value or NULL if nothing is cached
        # initially nothing is cached so set it to NULL
        cache <- NULL
        
        # store matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                # since the matrix is assigned a new value, flush the cache
                cache <<- NULL
        }
 
        # returns the stored matrix
        getMatrix <- function() {
                x
        }
 
        # cache the given argument 
        cacheInverse <- function(solve) {
                cache <<- solve
        }
 
        # get the cached value
        getInverse <- function() {
                cache
        }
        
        # return a list where each named element of the list is a function
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}
 
# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above
cacheSolve <- function(y, ...) {
        # get the cached value
        inverse <- y$getInverse()
        # if a cached value exists return it
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        # otherwise get the matrix, caclulate the inverse and store it in
        # the cache
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)
        
        # return the inverse
        inverse
}
 
##Thanks to vkatsikaros (rpog-assignment-2) for posting help

