function Xf = forward_euler(t,X,U,model)
% temp = X;
% N = 10;
% for i = 1:1:N
%     temp = temp + model.nl_ode(t,temp,U,model)*(model.dt/N);
% end
% 
% Xf = temp;


[~,x] = ode45(@(t,x) model.nl_ode(t,x,U,model),[t t+model.dt],X);
Xf = x(end,:)';
end