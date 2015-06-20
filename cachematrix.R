## This function will find the inverse of a Matrix and it will
## cache the results and return them if the same inverse is 
## requsted again

## Returns a list containing fuctions needed to cache matrix inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <-function()x
    set_inverse <- function(solve) i <<- solve 
    get_inverse <- function() i
    list(set = set, get = get,
         set_inverse = set_inverse, 
         get_inverse = get_inverse)
}


## Checks if the matrix inverse has aleady been solved, if so it
## retrieves it, else it solves for it and sets the cache 

cacheSolve <- function(x, ...) {
    i <- x$get_inverse()
    if(!is.null(i)){
        message("Call me Cachius Clay, getting your data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$set_inverse(i)
    i
}
