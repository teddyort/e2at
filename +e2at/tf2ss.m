function [ symss ] = tf2ss( tf )
% Convert a symbolic transfer function into a symss object in state-space
% representation with matrices A B C D in companion form.
% The symbolic tf should use symbolic variable 's' 

syms s
[num, den] = numden(tf);
num = coeffs(num,s);
den = coeffs(den,s);
den=den./den(end);  % Leading coefficient in den is 1
n = length(den)-1;
A = [[zeros(n-1,1) eye(n-1)];-den(1:end-1)];
B = [zeros(n-1,1);1];
C = [num zeros(n-length(num))];
D = 0;
symss = e2at.symss(A,B,C,D);
end

