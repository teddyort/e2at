function [ systf ] = sym2tf(symtf)
%SYM2TF Converts a symbolic transfer function to the tf type
% 
%   systf = SYM2TF(symtf) Returns a tf object for use with the Control
%   Toolbox functions
%
%   Note: The tf object ONLY allows numeric coefficients

[num, den]=numden(symtf);
num = sym2poly(num);
den = sym2poly(den);
systf = tf(num,den);

end