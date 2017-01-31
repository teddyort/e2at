function [ symss ] = eqns2ss( eqns, x, xd, u, y, extra)
%EQNS2SS Create a state-space representation of a dynamic system.
%
%   symss = EQN2SS(eqns, x, xd, u, y, extra) creates a state-space
%   representation of a dynamic system given a set of dynamic equations
%   where:
%       eqns is a vector of equations that define the system x is a
%       symbolic state vector xd is a symbolic vector representing the
%       derivative  x u is a symoblic vector representing the inputs y is a
%       symobolic vector representing the outputs extra is a vector of
%       extraneous symbols that are used as intermediate variables in eqns
%       Note: if x is (n x 1), u is (m x 1), and extra is size (q x 1) then
%       eqns must be (n+p x 1). (There must be 'p' extra equations to
%       eliminate 'p' extra variables.

% Remove extraneous variables
n = length(x);
m = length(u);
p = length(y);
r = struct2array(solve(eqns,[xd;y;extra]))';
sol = r(1:(n+p));

% Find A B C coefficients
block = arrayfun(@(r)get_coeffs(sol(r),[x;u])',1:(n+p),'UniformOutput',0)';
block = cat(1,block{:});  %unpack
A = block(1:n,1:n);
B = block(1:n,n+1:end);
C = block(n+1:end,1:n);
D = block(n+1:end,n+1:end);
symss = e2at.symss(A,B,C,D);
end

% Get the coefficients in a linear combination of variables.
function c = get_coeffs( p, vars )
    n = length(vars);
    c = sym(zeros(size(vars)));
    for j=1:n
        v = vars;
        v(1:n~=j)=0;
        c(j) = subs(p,vars,v)/vars(j);
    end
end
