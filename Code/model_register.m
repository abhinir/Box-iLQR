function [model] = model_register(modelName)


if strcmp(modelName, 'pendulum')
    model.name = 'pendulum';
    model.m = 0.5;
    model.L = 0.5;
    model.g = 9.81;

    model.nl_ode = @pendulum_nl_ode;
    model.state_prop = @pendulum_nl_state_prop;
    
    model.horizon = 5/model.dt;
    model.u_min = -1;
    model.u_max = 1;
    model.dt = 0.01;
    model.nx = 2;
    model.nu = 1;
    model.alpha = 1;
    model.alpha_floor = 1e-8;
    
    model.X0 = [0*pi/180;0];  %theta (rad), thetadot (rad/s)
    model.Xg = [180*pi/180;0];
    model.Q = 3 * eye(model.nx) * model.dt;
    model.R = 3 * eye(model.nu) * model.dt;
    model.Qf = 30*eye(model.nx);
    model.alpha = 1;

elseif  strcmp(modelName, 'cartpole')
    model.name = 'cartpole';
    model.M = 1;
    model.m = 0.01;
    model.L = 0.6;
    model.g = 9.81;

    model.dt = 0.01;
    model.nx = 4;
    model.nu = 1;
    
    model.alpha = 1;
    model.Xg = [0;0;0*pi/180;0]; %x, xdot, theta(rad), thetadot(rad/s)
    model.X0 = [0;0;180*pi/180;0];% pole bottom is pi
    model.R = 10*model.dt*eye(model.nu);
    model.Q = 10*model.dt*eye(model.nx);
    model.Qf = 10000*eye(model.nx);
    
    model.nl_ode = @cartpole_nl_ode;
    model.state_prop = @cartpole_nl_state_prop;
    
    model.horizon = 10/model.dt; %time horizon of the finite-horizon OCP
    
elseif strcmp(modelName, 'Acrobot')
    model.name = 'Acrobot';
    model.nx = 4;
    model.nu = 1;
    model.dt = 0.01;
    model.alpha = 1;
    model.u_max = 5;
    model.u_min = -5;
    model.Xg = [pi;0;0;0];
    model.X0 = [0;0;0;0];
    model.l1 = 1;
    model.l2 = 1;
    model.m1 = 1;
    model.m2 = 1;
    model.g = 9.81;
    model.Q = 500*model.dt*diag([1, 1, 1, 1]);
    model.R = 10*model.dt;
    model.Qf = 50000*diag([1, 1, 1, 1]);
    model.horizon = 10/model.dt;
    model.nl_ode = @acrobot_nl_ode;
    model.state_prop = @acrobot_nl_state_prop;

end

end
