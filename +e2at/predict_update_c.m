function pkgdot = predict_update_c( pkg,pkg_desc,A,B,C,u,Q,R,n,v,t )
%PREDICT_UPDATE_C executes the continuous predict and update step of the
%Kalman filter
%   
%   pkgdot = PREDICT_UPDATE_C(pkg,pkg_desc,A,B,C,u,Q,R,n,v,t) returns the
%   time derivatives for the inputs x, xh, and P packed in vector pkg for
%   use in ode45

    pkgdot = e2at.predict_c(pkg,pkg_desc,A,B,u,Q,n,t)+e2at.update_c(pkg,pkg_desc,C,v,R,t);
end
