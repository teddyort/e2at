function [x_hat_final,P_final,x_hat_hist,P_hist] = kalmanfilterdiscrete(x_hat_initial,P_initial,Q,R,G,T,dt,t_vec,u,y)
% discrete Kalman filter
% x_k+1 = A*(x_k)+B*u
% p_k+1 = A(P_k)A'+Q

% inputs x_hat_initial, P_initial, Q, R, total Time, time step, t_vec
% related to measurements, input (u), y 

x_hat_hist = zeros(1,T/dt);
P_hist = zeros(1,T/dt);

x_hat = x_hat_initial;
P = P_initial;
t = 0;
counter = 1;
for i = 1:T/dt
    
    t = t+i*dt;
    x_hat = G.A*x_hat+G.B*u;
    P = G.A*P*G.A'+ Q;
    
    if t == t_vec(counter)
        k = P*G.C'*inv(G.C*P*G.C' + R);
        x_hat = x_hat +k*(y(counter)-G.C*x_hat);
        P = P - k*G.C*P;
        counter = counter+1;
    end
    
    x_hat_hist(i) = x_hat;
    P_hist(i) = P;
    
    
    
end

