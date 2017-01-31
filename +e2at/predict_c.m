function pkgdot = predict_c( pkg,pkg_desc,A,B,u,Q,n,t )
%PREDICT_C executes the continuous predict step of the Kalman filter
%   
%   pkgdot = PREDICT_C(pkg,pkg_desc,A,B,u,Q,n,t) returns the time
%   derivatives for the inputs x, xh, and P packed in vector pkg for use in
%   ode45

[x, xh, P] = e2at.unpack(pkg,pkg_desc);
xdot = A*x + B*u(t) + n(t);
xhdot = A*xh + B*u(t);
Pdot = A*P + P*A' + Q;
pkgdot = e2at.pack(xdot,xhdot,Pdot);

end

