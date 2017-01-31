function pkgdot = update_c( pkg,pkg_desc,C,v,R,t )
%UPDATE_C executes the continuous updaate step of the Kalman filter
%   
%   pkgdot = UPDATE_C(pkg,pkg_desc,C,y,R,t) returns the time derivatives for
%   the inputs xh, and P packed in vector pkg for use in ode45

[x,xh,P] = e2at.unpack(pkg,pkg_desc);
K = P*C'/R;
y = C*x + v(t);
xhdot = K*(y - C*xh);
Pdot = -K*C*P;
pkgdot = e2at.pack(zeros(size(x)),xhdot,Pdot);

end

