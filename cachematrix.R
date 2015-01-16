## Set of functions to create special matrix object, able to cache its
## inverted value and avoid costly computation

## creates a special matrix that can cache it's inverted matrix
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

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
