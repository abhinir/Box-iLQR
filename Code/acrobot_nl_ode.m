function [state_dot] = acrobot_nl_ode(~, state, U, model)
    % --- Model Parameters ---
    l1 = model.l1;
    m1 = model.m1;
    I1 = m1*(l1^2)/12; % Inertia of link 1
    l2 = model.l2;
    m2 = model.m2;
    I2 = m2*(l2^2)/12; % Inertia of link 2
    g = model.g;

    % --- Unpack State Vector ---
    th1 = state(1);
    th2 = state(2);
    th1_dot = state(3);
    th2_dot = state(4);

    % --- Initialize State Derivative ---
    state_dot = zeros(4,1);

    % --- Kinematic Equations ---
    % The time derivative of angle is angular velocity
    state_dot(1) = th1_dot;
    state_dot(2) = th2_dot;

    % --- Dynamics Matrices ---
    % M(q) - Mass/Inertia Matrix
    M = [I1 + I2 + m1*(l1^2)/4 + m2*l1*l2*cos(th2) + m2*(l2^2)/4 + m2*(l1^2), I2 + m2*(l2^2)/4 + m2*l1*l2*cos(th2)/2;
         I2 + m2*(l2^2)/4 + m2*l1*l2*cos(th2)/2,                   I2 + m2*(l2^2)/4];

    % Cross coupling vector
    C = [-m2*l1*l2*th1_dot*th2_dot*sin(th2)-m2*l1*l2*(th2_dot^2)*sin(th2)/2;...
        m2*l1*l2*(th1_dot^2)*sin(th2)/2];

    % G(q) - Gravity Vector
    G = [m1*g*l1*sin(th1)/2 + m2*g*l1*sin(th1) + m2*g*l2*sin(th1 + th2)/2;...
        m2*g*l2*sin(th1 + th2)/2];

    % B - Input Matrix (torque U is applied to the second joint)
    B = [0; 1];

    % --- Solve for Accelerations (q_ddot) ---
   
    q_ddot = pinv(M)*(B*U - C - G);

    % --- Assign Accelerations to State Derivative ---
    % The time derivative of velocity is acceleration
    state_dot(3) = q_ddot(1);
    state_dot(4) = q_ddot(2);
end