## Set of functions to create special matrix object, able to cache its
## inverted value and avoid costly computation

## Creates a special matrix that can cache its inverted matrix
##
## The function will return four function to manipulate the matrix and it's
## inverted matrix:
##
## $get returns the original matrix
## $getinverted returns the cached inverted matrix
## $set sets the original matrix and empties the cache
## $setinverted sets the inverted matrix in cache
##
## Use cacheSolve for easy use of the structure
##
## !!! Does not check is the matrix is inversible !!!
makeCacheMatrix <- function(x = matrix()) {
    # By default, the inverted matrix cache is NULL (not computed)
    cached.inverted <- NULL

    # Sets the original matrix, and empty cache
    set <- function(y) {
        x <<- y
        cached.inverted <<- NULL
    }

    # Gets the matrix
    get <- function() {
        x
    }

    # Sets the inverted cache
    setinverted <- function(inverted) {
        cached.inverted <<- inverted
    }

    # Gets the cached inverted matrix
    getinverted <- function() {
        cached.inverted
    }

    # Returns the vector listing the utility functions
    list(set=set, get=get,
         setinverted=setinverted, getinverted=getinverted)
}


## Utility function to use special matrix with cache
##
## Computes inverted matrix of special matrix, or use the cache if available,
## then returns the inverted matrix of special matrix x.
## If there were no cache, store the inverted matrix in cache before returning
## it.
## !!! Does not check is the matrix is inversible !!!
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x', using a cache as possible

    # Let's first look of the special matrix has a non NULL cache
    inverted <- x$getinverted()

    if (!is.null(inverted)) {
        # Returns the cached inverted matrix
        return(inverted)
    }

    # And if the special matrix has no cache... then compute it, and cache it
    m <- x$get()
    inverted <- solve(m, ...)
    x$setinverted(inverted)

    # And returns the inverted matrix
    inverted
}
