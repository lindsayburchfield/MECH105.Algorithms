function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
[n,m]=size(A);
if n~=m
    error ('A is not a square matrix')
end
L = eye(n);
U = A;
P = eye(n);
for k= 1:n-1
    [~,r]=max(abs(U(k:n,k)));
    r=r+k-1;
    
    U([k r],k:n)=U([r k],k:n);
    P([k r],:)=P([r k],:);
    if k>1
        L([k r],1:k-1)=L([r k],1:k-1);
    end
    for i = k+1:n
        L(i,k)=U(i,k)/U(k,k);
        U(i,k:n)=U(i,k:n)-L(i,k)*U(k,k:n);
    end
end
if any(diag(U)==0)
    error('Factorization does not work')
end

end