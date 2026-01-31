function [state_n] = pendulum_nl_state_prop(t, state, U, model)

X_out = forward_euler(t, state, U, model);

state_n = X_out;
end