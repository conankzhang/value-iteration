function [U] = CS4300_MDP_policy_evaluation(S,A,P,R,gamma,max_iter, policy, U)
% CS4300_MDP_value_iteration - compute policy using value iteration
% On input:
%     S (vector): states (1 to n)
%     A (vector): actions (1 to k)
%     P (nxk struct array): transition model
%       (s,a).probs (a vector with n transition probabilities
%       (from s to s_prime, given action a)
%     R (vector): state rewards
%     gamma (float): discount factor
%     max_iter (int): max number of iterations
%     policy (nx1 vector): policy for problem
%     U (vector): state utilities
% On output:
%     U (vector): state utilities
% Call:
%     U = CS4300_MDP_policy_evaluation(S,A,P,R,gamma,k,policy,U);
% 
% Author:
%     Rajul Ramchandani & Conan Zhang
%     UU
%     Fall 2016

count = length(S);

if(count == 16)
    U = zeros(1,16);
    U_prime =zeros(1,16);
    U(16) = 1000;
    U(12) = -1000;
    U(11) = -1000;
    U(7) = 1000; 
    U_prime(16) = 1000;
    U_prime(12) = -1000;
    U_prime(11) = -1000;
    U_prime(7) = 1000;
else
    U = zeros(1,12);
    U_prime = zeros(1,12);
    U(12) =1;
    U(8) =-1;
    U_prime(12) =1;
    U_prime(8) =-1;
end
  
iter = 2;

while(iter <= max_iter)
    iter = iter + 1;
    U = U_prime;
    
    s_length = length(S);  
    for s1 = 1:s_length
       current_sum = 0;
       for s2 = 1:s_length     
          current_sum = current_sum + P(s1,policy(s1)).probs(s2)* U(s2);
       end
                 
       if count ==16
            if s1 ~= 16 && s1 ~= 12 && s1 ~= 11 && s1 ~= 7
                U_prime(s1) = R(s1) + (gamma * current_sum);
            end
       elseif count ==12
           if s1 ~= 12 && s1 ~= 8 && s1~=6
                U_prime(s1) = R(s1) + (gamma * current_sum);
           end
       end
    end
end