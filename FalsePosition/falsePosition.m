function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%func = the function being evaluated
%xl,xu = lower guess, upper guess
%es = the desired relative error (should default to 0.0001%)
%maxit = the maximum number of iterations to use (should default to 200)
%varargin,... = any additional parameters used by the function
if nargin < 3, ('minimum 3 inputs required');
end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test > 0, error ('no sign change'),
end
if nargin < 4 || isempty(es)
    es = 0.0001;
end
if nargin < 5 || isempty(maxit)
    maxit = 200;
end

iter = 0;
xr = xl;
ea = 100;

while(1)
    xr_old=xr; xr=(xu-(func(xu)*(xl-xu))/(func(xl)-func(xu)));
    iter = iter+1;
    if xr~=0, ea = abs((xr-xr_old)/xr)*100;
    end
    test = func(xl,varargin{:})*func(xr,varargin{:});
    if test < 0
        xu =xr;
    elseif test > 0
        xl =xr;
    else
        ea = 0;
    end
    if ea<= es||iter>=maxit, break, end
end
root = xr;
fx = func(xr,varargin{:});
end