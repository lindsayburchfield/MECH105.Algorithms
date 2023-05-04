function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

if length(x)~=length(y)
    error('X and Y arrays are not the same size')
end

[Y, sortOrder]=sort(y);
X=x(sortOrder);
n=length(x);
S=floor((n+1)/4);
T=floor((3*n+3)/4);
Q1=Y(S);
Q3=Y(T);
IQR=Q3-Q1
threshold=1.5.*IQR;

onesmatrix=logical(ones(1,n));
for j = 1:n
    if Y(j)<(Q1-threshold)||Y(j)>(Q3+threshold);
        onesmatrix(j)=0;
    end
end
Y=Y(onesmatrix);
X=X(onesmatrix);

n_new=length(y);
y_avg=mean(Y);
x_avg=mean(X);
SSx=sum((X-x_avg).^2);
SP=sum((X-x_avg).*(Y-y_avg));
slope=SP/SSx

intercept=y_avg-slope.*x_avg;
line=slope.*X+intercept;
f=@(x) intercept+slope.*x;
fX=X;
fY=Y;
S_t=sum((fY-y_avg).^2);
S_r=sum((fY-line).^2);
Rsquared=1-(S_r/S_t)
end