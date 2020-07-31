% Modify the function inside the f.m file
% Modify the gradient inside the grad.m file
% Modify the Hessian inside the hess.m file

X_INIT = [5, -2];
ALPHA = 0.01;
MAX_ITER = 50;
max_error = 0.001;

[X, g, i] = DFP(f, grad, hess, X_INIT, ALPHA, MAX_ITER, max_error);

disp('The optimized value of the funciton is: ')
disp(f(X(i,:)))
disp('The optimum value of input is: ')
disp(X(i,:))