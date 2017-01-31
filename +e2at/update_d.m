function [xhat_new, P_new] = update_d(xhat, P, C, y, R)
%UPDATE_D Does a discrete time update for kalman filter
%   [xhat_new, P_new] = UPDATE_D(xhat, P, C, y, R) Returns the new values 
%   after updating the estimate using the new measurement in y
    
    K           = P*C'/(C*P*C'+R);
    xhat_new    = xhat + K*(y-C*xhat);
    P_new       = P-K*C*P;

end

