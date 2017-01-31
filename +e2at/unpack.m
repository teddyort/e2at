function [ varargout ] = unpack( pkg, pkg_desc )
%UNPACK Unpacks a vector pkg, created using the e2at.pack(A,B,C,...) back
%into the original matrices A,B,C,...
%
%   [A,B,C,...] = UNPACK(pkg, pkg_desc) Returns the original
%   matrices/vectors [A,B,C,

    n=length(pkg_desc)/2;
    % Checks
    if ~mod(n,2), error('pkg_desc must contain an odd number of elements'); end
    if nargout ~= n, error([num2str(nargout) ' output arguments but pkg contains ' num2str(n) ' items']); end
    
    ind = [0;cumsum(pkg_desc(1:2:end-1).*pkg_desc(2:2:end))];
    chunks = arrayfun(@(x) pkg(ind(x)+1:ind(x+1)),1:n,'UniformOutput',0);
    varargout=arrayfun(@(x) reshape(chunks{x},[pkg_desc(2*x-1),pkg_desc(2*x)]),1:n,'UniformOutput',0);
end

