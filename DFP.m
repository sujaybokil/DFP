num_var = 2;

function [X, g, i] = DFP(func, grad, hess, x_init, alpha, max_iter, permissible_error)
    
    X = zeros(MAX_ITER, num_var);
    g = zeros(MAX_ITER, num_var);
    
    X(1,:) = x_init; 
    B = inv(hess(X(1,:)));
    i=1;
    
    for k = 1:max_iter
        
        g(k,:) = grad(X(k,:));
      
        X(k+1,:) = X(k,:) - alpha*B*g(k,:);
        g(k+1,:) = grad(X(k+1,:));
        
        p_k = X(k+1,:) - X(k,:);
        q_k = g(k+1,:)- g(k,:);
        
        B = B - (B*(p_k*p_k')*B)/(p_k'*B*p_k) + (q_k*q_k')/(p_k'*q_k);
       
        i = i + 1;
        
        disp('Input value:');
        disp(X(k+1,:));
        disp('Function value:');
        disp( func(X(k+1,:)));
        
        if func(X(k,:)) - func(X(k+1,:)) < permissible_error
            i = k;
            break;
        end
        
    end
    
end