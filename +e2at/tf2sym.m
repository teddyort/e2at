function [ symtf ] = tf2sym(tf)
%TF2SYM Converts a transfer function object to a symbolic version
%
%   symtf = TF2SYM(tf) Returns a symbolic transfer function where the 
%
%   The symtf uses the symbol 's' to represent the laplace transform 
%   variable

[num, den]=tfdata(tf);
syms s;
symtf=poly2sym(cell2mat(num), s)/poly2sym(cell2mat(den),s);

end