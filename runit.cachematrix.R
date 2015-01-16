test.makeCacheMatrix <- function() {
    # This is the original matrix and the expected result
    ori_m <- matrix(c(7, 3, -2, 5), nrow=2)
    inv_m <- solve(m)

    # Let's create the cache matrix, cache should be empty
    m <- makeCacheMatrix(ori_m)
    checkTrue(is.null(m$getinverted()))

    # And when we compute the inverted matrix, the cache should be set
    # and the values correct
    inv <- cacheSolve(m)
    checkEquals(inv, inv_m)
    checkTrue(!is.null(m$getinverted()))
    checkEquals(m$getinverted(), inv_m)

    # Even twice, just to be sure
    inv <- cacheSolve(m)
    checkEquals(inv, inv_m)
    checkTrue(!is.null(m$getinverted()))
    checkEquals(m$getinverted(), inv_m)

    # Call to set should empties the cache
    m$set(ori_m)
    checkTrue(is.null(m$getinverted()))
}
