function [state_dot] = cartpole_nl_ode(t, state, U, model)

    f = zeros(model.nx, 1);
    g = zeros(model.nx, 1);

    x = state(1);
    x_dot = state(2);
    theta = state(3);
    theta_dot = state(4);

    term1 = model.m/(model.M + model.m - model.m*(cos(theta)^2)); %intermediate variable
    term2 = term1*(model.g*sin(theta)*cos(theta) - model.L*sin(theta)*(theta_dot^2));

    f(1) = x_dot;
    f(2) = term2;
    f(3) = theta_dot;
    f(4) = (model.g*sin(theta)/model.L) + (cos(theta)/model.L)*term2;

    g(1) = 0;
    g(2) = term1*U/model.m;
    g(3) = 0;
    g(4) = (cos(theta)/model.L)*term1*U/model.m;

    state_dot = f + g;

end

% function [state_dot] = cartpole_nl_ode(~, state, U, model)
%     state_dot = zeros(4,1);
% 
%     x = state(1);
%     x_dot = state(2);
%     theta = state(3);
%     theta_dot = state(4);
% 
%     M = model.M;
%     m = model.m;
%     L = model.L;
% 
%     det_M = (M*m*L^2 + (m^2)*(L^2)*(sin(theta)^2));
%     M_inv = (1/det_M)*[m*L^2, -m*L*cos(theta);...
%         -m*L*cos(theta), M+m];
% 
%     C = [-m*L*(theta_dot^2)*(sin(theta));0];
%     G = [0; -m*model.g*L*sin(theta)];
%     ddot = M_inv*([1;0]*U - C - G);
% 
%     state_dot(1) = x_dot;
%     state_dot(2) = ddot(1);
%     state_dot(3) = theta_dot;
%     state_dot(4) = ddot(2);
% 
% 
% end