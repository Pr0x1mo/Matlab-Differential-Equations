%The matrix A is defined for you (and locked so you cannot change its definition)
A = [0.9653    0.0345    0.8963   -0.8830   -0.4327    0.9822    1.3811;
    -0.4002   -0.3695    0.3388   -0.7290   -0.0606   -1.3775    0.6377;
     0.6734   -0.2631    1.1996    0.6106    0.1278    0.7653    0.4537;
     0.9755   -0.2065    1.3885    0.4758    0.5416    0.1616    1.2478;
     0.2546   -0.4360    1.1266    0.8531   -0.7262    2.1241   -0.8887;
     0.1431   -0.8431    1.8293   -0.7305   -0.5756   -0.2793    1.1411;
    -0.2426    0.3752   -0.9930    0.9713   -0.0005    1.1049   -1.5896;
     0.5974   -0.6121    1.8216    0.0908   -0.5123    1.1007    0.6064];
%Find the dimension of its nullspace
N = null(A)
dim = size(N,2)
%You must create a matrix N and variable dim as described above.

B = A*N


%Finally, look at B = A*N. Is this a matrix of zeroes? Why or why not?
%Note that numerically, values close to zero should be assumed to be equal to zero.
%But why is it not an exact equality?

%-----Part 2----------

warning off backtrace
% The matrix A below
A = [ -0.7950   -2.3851   -0.9578    0.1628   -0.1628;
      -0.1236   -0.3708   -0.8113    0.6877   -0.6877;
      -0.5517   -1.6551    0.5935   -1.1452    1.1452;
       0.3406    1.0219   -0.1154    0.4560   -0.4560];
%Use the backslash command to solve for x 
b = [0;0;0;0]
x = A\b
Null = null(A)
% Find the dimension of the nullspace to see if this makes any sense. 
% Store the dimension in a variable called dim
% Hint first run the code (commenting out the line below), then enter a number.
dim = size(Null,2)


%----Part 3 -------------------------------------------

%Find a nonzero solution x to Ax=0.
A = [ -0.7950   -2.3851   -0.9578    0.1628   -0.1628;
      -0.1236   -0.3708   -0.8113    0.6877   -0.6877;
      -0.5517   -1.6551    0.5935   -1.1452    1.1452;
       0.3406    1.0219   -0.1154    0.4560   -0.4560];



[U S V] = svd(A);
x = V(:,end)
%Check that x is a solution:
b = A*x