function policy = CS4300_run_value_iteration()
% CS4300_MDP_value_iteration - compute policy using value iteration
% On input:
%     gamma (float): discount factor
%     max_iter (int): max number of iterations
% On output:
%     U (vector): state utilities
%     U_trace (iterxn): trace of utility values during iteration
% Call:
%     [U,Ut] = Cs4300_run_value_iteration(S,A,P,R,0.999999,0.1,100);
% Author:
%     Rajul Ramchandani & Conan Zhang
%     UU
%     Fall 2016
%

S = [[1,2], [2,1]];
A = [1,2,3,4];
R = -0.04;
gamma = 0.999999;
eta = 0.1;
max_iter = 100;

[U,Ut] = CS4300_MDP_value_iteration(S,A,P,R, gamma, eta, max_iter);
