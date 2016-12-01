function [policy,U,Ut] = CS4300_MDP_policy_iteration(S,A,P,R,k,gamma)
% CS4300_MDP_policy_iteration - policy iteration
%  Chapter 17 Russell and Norvig (Table p. 657)
% On input:
%     S (vector): states (1 to n)
%     A (vector): actions (1 to k)
%     P (nxk array): transition model
%     R (vector): state rewards
%     k (int): number of iterations
%     gamma (float): discount factor
% On output:
%     policy (nx1 vector): policy for problem
%     U (nx1 vector): final utilities found
%     Ut (num_iter by n array): trace of utilities (each is U at that step)
% Call:
%
%    Layout:               1
%                          ˆ
%     9 10 11 12           |
%     5  6  7  8       2 <- ->  4
%     1  2  3  4           |
%                          V
%                          3
%     [S,A,R,P,U,Ut] = CS4300_run_value_iteration(0.999999,1000);
%     [p,Up,Tpt] = CS4300_MDP_policy_iteration(S,A,P,R,10,0.999)
%     p’
%
% p =
%
%     1          corrresponds to:
%     2
%     2                 ->   ->  ->   X
%     2                 ˆ    X    ˆ   X
%     1                 ˆ    <-  <-  <-
%     1
%     1
%     1
%     4
%     4
%     4
%     1
%
% Author:
%     Rajul Ramchandani & Conan Zhang
%     UU
%     Fall 2016
%

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

U_trace(1,:) = U;
  
iter = 2;

while( iter <= max_iter)
    iter = iter + 1;
    U = U_prime;
    delta = 0;
    
    s_length = length(S);  
    for s1 = 1:s_length
       
       best_val = -Inf;

       a_length = length(A);
       for a = 1:a_length
          a_sum = 0;
          for s2 = 1:s_length     
             a_sum = a_sum + P(s1,a).probs(s2)* U(s2);
          end
          
          if(a_sum > best_val)
                best_val = a_sum;
                best_action = a; 
          end
          
       end
       
       if count ==16
            if s1 ~= 16 && s1 ~= 12 && s1 ~= 11 && s1 ~= 7
                U_prime(s1) = R(s1) + (gamma * best_val);
            end
       elseif count ==12
           if s1 ~= 12 && s1 ~= 8 && s1~=6
                U_prime(s1) = R(s1) + (gamma * best_val);
           end
       end
     

       if(abs(U_prime(s1) - U(s1)) > delta)
           delta = abs(U_prime(s1) - U(s1));
       end
    end
    
    U_trace(end+1,:) = U_prime;

    if(delta < (eta * (1 - gamma)/gamma))
        return;
    end
end