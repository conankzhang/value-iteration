function [policy,U,Ut] = CS4300_run_policy_iteration()
% CS4300_run_policy_iteration - policy iteration driver
% On input:
%     gamma (float): discount factor
%     max_iter (int): max number of iterations
% On output:
%     U (vector): state utilities
%     U_trace (iterxn): trace of utility values during iteration
% Call:
%     [U,Ut] = CS4300_run_policy_iteration(0.999999,0.1,100);
% Author:
%     Rajul Ramchandani & Conan Zhang
%     UU
%     Fall 2016
%

% S = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
% A = [1,2,3,4];
% P = CS4300_Probs44();
% R = [-1,-1,-1,-1,-1,-1,-1,-1000,-1,-1,-1,-1000,-1000,-1,-1,-1,1000];
S = [1,2,3,4,5,6,7,8,9,10,11,12];
A = [1,2,3,4];
P = CS4300_Probs34();
R = ones(1,12)*-0.04;
R(12) = 1;
R(8) = -1;
gamma = 0.999999;
max_iter = 100;

[policy,U,Ut] = CS4300_MDP_policy_iteration(S,A,P,R, max_iter, gamma);
Ut
% time = [];
% for t= 0:31
%     time(end+1) = t;
% end
% 
% plot(time, Ut(:,12), 'DisplayName', 'Actual vel in x');
% text(length(Ut(:,12)),Ut(end,12),'(4,3)');
% title('Figure 1')
% xlabel('Number of Iterations')
% ylabel('Utility Estimates')
% hold on;
% 
% plot(time, Ut(:,11), 'DisplayName', 'Actual vel in x');
% text(length(Ut(:,11)),Ut(end,11),'(3,3)');
% hold on;
% 
% plot(time, Ut(:,3), 'DisplayName', 'Actual vel in x');
% text(length(Ut(:,3)),Ut(end,3),'(3,1)');
% hold on;
% 
% plot(time, Ut(:,1), 'DisplayName', 'Actual vel in x');
% text(length(Ut(:,1)),Ut(end,1),'(1,1)');
% hold on;
% 
% plot(time, Ut(:,4), 'DisplayName', 'Actual vel in x');
% text(length(Ut(:,4)),Ut(end,4),'(4,1)');
