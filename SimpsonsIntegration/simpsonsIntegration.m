function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
if length(x)~=length(y)
    error('x and y must be the same length')
end

dx=diff(x);
if any(abs(dx-dx(1))>1e-8)
    error('x must be spaced equally')
end
n = length(x)-1;
h=dx(1);

if mod(n,2)==0
    I = (h/3)*(y(1)+4*sum(y(2:2:end))+2*sum(y(3:2:end-2))+y(end));
else
    warning('trap rule used on last interval');
    I=(h/2).*(y(1)+2.*sum(y(2:end-1))+y(end));
end

end