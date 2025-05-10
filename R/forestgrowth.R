#' 1-Forest Growth
#'
#'
#' Measures the growth of a forest over time. The model uses two 
#' equations to track growth. One when the forest is below the 
#' threshold canopy closure and one when it is above it. Forest size
#' is measured in units of Carbon (C)
#' @param time time since start
#' @param parms as list with three values, r, C, g, thres
#' @param r early exponentional growth rate (kg C/year)
#' @param y initial size of the Forest (kg C)
#' @param g linear growth rate once canopy closure is reached (kg C/year)
#' @param K carrying capacity (kg C)
#' @param thres canopy closure threshold (kg C)
#' @return dC derivative of the forest growth (kg C/year)
#' @examples
 

forest <- function(t, y, parms) {
  # Check if the forest is below the threshold canopy closure
  if (y < parms$thres) {
    # Calculate growth using the exponential growth equation
    dC <- parms$r * y
  } else {
    # Calculate growth using the linear growth equation
    dC <- parms$g * (1 - y / parms$K)
  }
  return(list(dC))
}