function policy = CS4300_MDP_policy(S,A,P,U)
% CS4300_MDP_policy - generate a policy from utilities
% See p. 648 Russell & Norvig
% On input:
%     S (vector): states (1 to n)
%     A (vector): actions (1 to k)
%     P (nxk struct array): transition model
%       (s,a).probs (a vector with n transition probabilities
%       from s to s_prime, given action a)
%     U (vector): state utilities
% On output:
%     policy (vector): actions per state
% Call:
%     p = CS4300_MDP_policy(S,A,P,U);
% Author:
%     Rajul Ramchandani & Conan Zhang
%     UU
%     Fall 2016
%

count = length(S);


best_action = 1;
default_policy_action =1;

  

done = 0;
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
                
                best_action = a; 
          end
          
       end
       
       if count ==16
            if s1 ~= 16 && s1 ~= 12 && s1 ~= 11 && s1 ~= 7
                policy(end+1) = best_action;
            else 
                policy(end+1) = default_policy_action;
            end
       elseif count ==12
           if s1 ~= 12 && s1 ~= 8 && s1~=6
                policy(end+1) = best_action;
            else 
                policy(end+1) = default_policy_action;
           end
       end
     

    end
    
end
    


