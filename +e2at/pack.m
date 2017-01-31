function [pkg, pkg_desc] = pack( varargin )
%PACK Packs an arbitrary number of matrices and/or vectors into a state
%vector pkg. The description of the orignal matrices is stored in pkg_desc
%Use with the UNPACK function to undo this.
%
%   [pkg, pkg_desc] = PACK(A,B,C,...) Packes the matrices A,B,C,... into
%   pkg described by pkg_description
% 
%   If the product of all the dimensions of the inputs is n, the output
%   vector pkg will be size (n by 1)
    pkg_desc = cell2mat(cellfun(@(x) size(x),varargin,'UniformOutput',0))';  
    pkg = cell2mat(cellfun(@(x) x(:), varargin, 'UniformOutput',0)');

end

