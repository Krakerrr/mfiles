function y = lpfilter(u,tau,dt)
% lp filter
% G =  1 / ( tau * s + 1) 

k = tau / dt;
k1  = 1 / (k+1);
y  = u.*0; % init
for iter = 2:length(u)
    y(iter) = k1 * (u(iter) + k * y(iter-1));
    
end

%% new
% a = dt / (tau + dt);
% y  = u.*0; % init
% for iter = 2:length(u)
%     y(iter) = (1-a)*y(iter-1) + a * u(iter);
% end

end