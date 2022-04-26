B = randi([0,50],3);
% randi = random integer, it takes ( r, c)
%r in this case is [0,50] a range of numbers from 1 thru 50
% cols in this case is just 3 columns
% Input your 3x3 matrix A and the 3x1 vector b
A = [2,1,1;1,7,4;-3,5,10];
b = [1;-1;1];
% Now create the 3x4 matrix Augmented matrix. You do not need to type out all of the elements again!
% Think about what we learnt about creating arrays in recitation 1.
%
Aug = [A,b]
%
% MATLAB will now calculate the reduced row echelon form of Aug
%
R = rref(Aug)
%
% Recall For a 3x3 matrix, the solution x (if it exists) will just be the last column of R. 
% Extract the last column of R and assign it to a variable x.
%
x = R(:,4)
%
% Now check that this does indeed solve the problem by calculating b1 = A*x.
b1 = A*x   

%create a random 4x4 matrix A (values between 0 and 1)
A = rand(4,4)
%create a random column vector b with 4 entries (values between 0 and 1)
b = rand(4,1)

%Solve the linear system Ax=b using the backslash command
x = A\b

% get the null space of a matrix by 
nullspace = (A, 'r')

%The matrix A is defined for you (and locked so you cannot change its definition)
A = [0.9653    0.0345    0.8963   -0.8830   -0.4327    0.9822    1.3811;
    -0.4002   -0.3695    0.3388   -0.7290   -0.0606   -1.3775    0.6377;
     0.6734   -0.2631    1.1996    0.6106    0.1278    0.7653    0.4537;
     0.9755   -0.2065    1.3885    0.4758    0.5416    0.1616    1.2478;
     0.2546   -0.4360    1.1266    0.8531   -0.7262    2.1241   -0.8887;
     0.1431   -0.8431    1.8293   -0.7305   -0.5756   -0.2793    1.1411;
    -0.2426    0.3752   -0.9930    0.9713   -0.0005    1.1049   -1.5896;
     0.5974   -0.6121    1.8216    0.0908   -0.5123    1.1007    0.6064];

N = null(A)
%Find the dimension of its nullspace
dim = size(N,2)
%You must create a matrix N and variable dim as described above.

B = A*N

%Find a nonzero solution x to Ax=0.
A = [ -0.7950   -2.3851   -0.9578    0.1628   -0.1628;
      -0.1236   -0.3708   -0.8113    0.6877   -0.6877;
      -0.5517   -1.6551    0.5935   -1.1452    1.1452;
       0.3406    1.0219   -0.1154    0.4560   -0.4560];
%nonzero solution x to Ax=0.
[U S V] = svd(A);
x = V(:,end)
%Check that x is a solution:
b = A*x

syms x y z
eqn1 = x^2 + y^2 + (z -4)^2 - 9
eqn2 = (x-0.2)^2 + (y+0.6)^2 + (z-4)^2 - 9.4
eqn3 = (x- 0.2)^2 + (y-1.7)^2 + (z - 3.5)^2 - 9.18
eqn4 = x^2 + (y - 1.7)^2 + (z - 3.8)^2 - 10.73

 sol = solve(eqn1, eqn2, eqn3, eqn4)

 sol.x
 sol.y
 sol.z
 
 A = sym([1,2,3,4,5;-1,-2,9,10,11;1,2,9,11,13])
 
 %column space is the pivot columns of A 
% in row echelon form
cs = colspace(A)
%nullspace is 
ns = null(A)
%size of nullspace A is:
dimns = size(ns,2) % size(m,n) we want n for this
%size of colspace A is:
dimcs = size(cs,2) % size(m,n) we want n for this
%nullity of A 
nullityOfA = size(ns,2) = dimns %size of(m,n) we want M
% rank of ColumnSpace
rank(cs) = size(cs,2)
rank(A) = dimcs
nullity(A) + rank(A) = size(A,2) = n

nullity(A) = dimns
rank(A) = dimcs 

% therefore
dimns + rank(A) = n columns

I = eye(10) %10 by 10 identity matrix

Z = zeros(10) % 10 by 10 matrix of 0's

A = sym([])
[v,d] = eig(A)
v = eigenvectors
d = diagnol of eigenvalues

x'' + 5x' + 6 x = 0 
u = [1 5 6]
A = compan(u)
rot90(A,2) to get the companion matrix


a = 0; b = 100; C = a:30:b % the 30 will space between each number in a and b

characteristic polynomial equation finder:
A = [0, 1, -1;
-1, 0, 0;
1, 0, -R;]
syms lambda
charpoly(A, lambda)

%Numerically solve DE and time how long it takes
x0 = -2;                               %The initial condition, x(0)
tspan = [0,2];                        %The time interval, tspan
tic;                                  %Start timer
[t,x] = ode45(@(t,x) t*x^2,tspan,x0); %Use ODE45 to compute numerical solution ode45(function f of x or f of x of t, 
%the equation, and interval, and the initial comdition answer)
timeElapsed = toc;                    %Stop timer
disp(['It took ODE45 ',num2str(timeElapsed,3), ' seconds to compute the solution']);

%Enter analytic solution
xTrue = -2./(1+t.^2);

 f = @(t,x) [x(2); -2*x(2) - x(1)];
[t,x] = ode45(f ,tspan,x0);


x = sym('x','positive');    
y = sym('y','positive');    
z = sym('z','positive');
a = sym('a','positive');
b = sym('b','positive');
%% define equations
f1 = x*(1-x-a*y-b*x);
f2 = y*(1-y-b*x-a*z);
f3 = z*(1-z-a*x-b*y);
%% solve equations
[solx, soly, solz] = solve(f1>0, f2>0, f3>0)

