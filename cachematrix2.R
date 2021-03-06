##Functions create inversed matrix and also cache the inverse of matrix

##This function stores the matrix and a cached value of the inverse of the matrix.
##sets and gets the value of a matrix, gets and sets the cached value of a matrix
makeCacheMatrix <- function(orgMatrix = matrix()) {

	if (!is.matrix(orgMatrix)) {
    		stop("Create a matrix")
  		}
# holds the cached value or NULL
	invMatrix <- NULL
#sets new matrix 
    	set <- function(y) {
      orgMatrix <<- y
      invMatrix <<- NULL
	}
    	get <- function() orgMatrix
# sets inversed matrix
    	setInverse <- function(inverse) invMatrix <<- inverse
    	getInverse <- function() invMatrix
# return a list. Each named element of the list is a function
    	list(set=set, get=get, setinverse=setInverse, getinverse=getInverse)
}


## This function calculates the inverse of a matrix got and set by function makeCacheMatrix
##But if matrix is already inversed it returns that matrix 
cacheSolve <- function(cachMatrix, ...) {
#Sets inversed matrix or null
      invMatrix <- cachMatrix$getInverse()
#if it is not a null returns already inversed Matrix
    	if(!is.null(invMatrix)) {
		message("getting cached data")
      	return(invMatrix)
    		}
#if it is null gets original matrix 
    	ToInv <- cachMatrix$get()
#inverses it 
    	invMatrix <- solve(ToInv)
#set inversed matrix
    	cachMatrix$setInverse(invMatrix)
    	invMatrix
}
