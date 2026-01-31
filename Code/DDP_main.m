clc;
clear;
close all;
%% Initialization
model = model_register('Acrobot');

num_outer_loop_iter = 200;
u_merged = [];
x_merged = [];
sigma_merged = [];
maxIte  = 1000;
sigma = 1e8;
red_factor = 0.5;
beta = (1/0.95);

%%
u_guess = zeros(model.nu, model.horizon);

tic
for i = 1:1:num_outer_loop_iter

    [x_nom, u_nom, cost, k, K, Vx, Vxx, der, x ,...
        u, alpha, Quu] =...
        Box_ILQR(model, model.X0, model.Xg, u_guess, model.horizon,...
                        model.Q, model.R, model.Qf, maxIte, sigma);
    
    
    if sigma < eps_barr || red_factor>1
        break;
    end
    if max(u_nom(1,:)) > model.u_max || min(u_nom(1,:)) < model.u_min
        fprintf('Control Constraint Violated\n')
        sigma = sigma./red_factor;
        red_factor = red_factor*beta;
        sigma = sigma.*red_factor;
        continue;
    % elseif max(x_nom(1,:)) > 0.2 || min(x_nom(1,:)) < -0.2
    %     fprintf('State Constraint Violated\n')
    %     sigma(2) = sigma(2)*red_factor(2);
    %     red_factor(2) = red_factor(2)*0.95;
    %     sigma(2) = sigma(2)/red_factor(2);
    %     continue
    else
        u_guess = u_nom;
        u_merged = [u_merged;u_nom];
        x_merged = [x_merged;x_nom];
        sigma_merged = [sigma_merged;sigma];
        sigma = sigma.*red_factor;
    end

end
toc
