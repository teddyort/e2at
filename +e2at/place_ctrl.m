function [ G ] = place_ctrl( A, B, poles )
%PLACE_CTRL Calculates the gain G of a full state controller with the
%desired poles.
%   G = place_ctrl(A,B,poles) Returns the gain G that would make the closed
%   loop system have the desired poles
%
%   G = place_ctrl(symss, poles) equivalent to: 
%           place_ctrl(symss.A, symss.B, poles)
    if nargin==2
        poles = B;
        [A,B]=A.abcd;
    end
    C = zeros(1,length(A));
    D = 0;
    
    [Ac, ~, ~, ~, P] = e2at.companion(A,B,C,D); 
    coef_desired = poly(poles); %get characteristic polynomial
    last_line = -Ac(end, :);
    system_coef = last_line(end:-1:1); 
    coef_diff = system_coef - coef_desired(2:end); 
    G = coef_diff(end:-1:1);
    G = -G*P; %multiply by negative 1 such that u=-Gx
end

