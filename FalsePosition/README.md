# False Position Algorithm
This algorithm finds the roots of a function using the false position method. In order to operate this code, input your function as well as upper and lower guesses.
## Inputs
* func - the function being evaluated
* x_l - the lower guess
* x_u - the upper guess
* es - the desired relative error (should default to 0.0001%)
* maxit - the maximum number of iterations to use (should default to 200)
* varargin, . . . - any additional parameters used by the function
## Outputs:
* root - the estimated root location
* fx - the function evaluated at the root location
* ea - the approximate relative error (%)
* iter - how many iterations were performed
