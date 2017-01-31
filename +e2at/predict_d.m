function [x_new, xhat_new, P_new] = predict_d(x, xhat, P, A, B, u, w, Q)
%PREDICT_D Does a discrete time prediction for kalman filter
%   [x_new, xhat_new, P_new] = PREDICT_D(x, xhat, P, A, B, u, w, Q) Returns
%   the new values at the next time step predicted using the system model
%   parameters

    x_new       = A*x+B*u+w;
    xhat_new    = A*xhat+B*u;
    P_new       = A*P*A'+Q;

end

