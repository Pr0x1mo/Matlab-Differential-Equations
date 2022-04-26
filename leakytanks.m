% Input the 2x2 matrix describing your linear system as a variable A
A = [-1,1;1,-1]
% Input your initial conditions as a column vector x0
x0 = [0;1]
% Use eig(A) to find the eigenvalues and eigenvectors of A. 
% Then define the eigenvectors as column vectors v1 and v2, and the eigenvalues as lambda1, lambda2
% so that A*v1 = lambda1*v1, etc.
[V,D] = eig(A)
v1 = V(:,1)
v2 = V(:,2)
lambda1 = D(1,1)
lambda2 = D(2,2)
% Calculate the column vector c = [c1;c2] from the initial conditions using inv(V)
c = inv(V) * x0
c1 = c(1,1); c2 = c(2,1);

%--- Part 2 ----------

%%% Copy and paste all of the correct code from the previous part here
A = [-1,1;1,-1];
% Input your initial conditions as a column vector x0
x0 = [0;1];
% Use eig(A) to find the eigenvalues and eigenvectors of A. 
% Then define the eigenvectors as column vectors v1 and v2, and the eigenvalues as lambda1, lambda2
% so that A*v1 = lambda1*v1, etc.
[V,D] = eig(A);
v1 = V(:,1);
v2 = V(:,2);
lambda1 = D(1,1);
lambda2 = D(2,2);
% Calculate the column vector c = [c1;c2] from the initial conditions using inv(V)
c = inv(V) * x0;
c1 = c(1,1); c2 = c(2,1);
%%% Define a row vector t with 100 equally spaced entries, 
%%% beginning with 0 and ending at 4.
t = linspace(0,4,100);
%%% Define two row vectors h1 and h2, with entries corresponding 
%%% to h1(t) and h2(t) evaluated at each time in t.
lam1t = exp(lambda1*t);
lam2t = exp(lambda2*t);



h1 = c1*lam1t*v1(1,1) + c2*lam2t*v2(1,1) %c1*lam1t*v1(1,1) + c1*lam2t*v2(1,1)
h2 = c1*lam1t*v1(2,1) + c2*lam2t*v2(2,1);
%%% Now use plot to plot the two vectors against time on the same figure
%
plot(t,h1) %tell MATLAB to plot h1 here
%
hold on % You need to put this command in between the plot commands so that the curves appear on the same figure
%
plot(t,h2) %tell MATLAB to plot h2 here
%
% Don't worry about the following commands, they are just formatting commands for the figure
set(gca,'fontsize',18)
xlabel('Time')
ylabel('Volume')
title('Time series')

%-------Part 4------

% Input the 3x3 matrix describing your linear system as a variable A
A =  [-2,1,1;1,-2,1;1,1,-2];
% Input your initial conditions as a column vector x0
x0 =[0;1;0];
% Use eig(A) to find the eigenvalues and eigenvectors of A 
% Define the eigenvectors as column vectors v1, v2 and v3,
% and the eigenvalues as lambda1, lambda2, lambda3
% so that A*v1 = lambda1*v1, etc.
[V,D] = eig(A);
v1 = V(:,1);
v2 = V(:,2);
v3 = V(:,3);
d = diag(D);
lambda1 = d(1,1);
lambda2 = d(2,1);
lambda3 = d(3,1);
% Calculate the column vector c = [c1;c2;c3] from the initial conditions using inv(V)
c = inv(V) * x0;
c1 = c(1,1); c2 = c(2,1); c3 = c(3,1);
%%% Define a row vector t with 100 equally spaced entries, 
%%% beginning with 0 and ending at 4.
t = linspace(0,4, 100);
lam1t = exp(lambda1*t);
lam2t = exp(lambda2*t);
lam3t = exp(lambda3*t);
%%% Define three row vectors h1, h2 and h3, with entries corresponding 
%%% to h1(t), h2(t) and h3(t) evaluated at each time in t.
h1 = c1*lam1t*v1(1,1) + c2*lam2t*v2(1,1) + c3*lam3t*v3(1,1);
h2 = c1*lam1t*v1(2,1) + c2*lam2t*v2(2,1) + c3*lam3t*v3(2,1);
h3 = c1*lam1t*v1(3,1) + c2*lam2t*v2(3,1) + c3*lam3t*v3(3,1);
%%% Now use plot to plot the three vectors against time on the same figure
plot(t,h1,h2,h3)
hold on

set(gca,'fontsize',18)
xlabel('Time')
ylabel('Volume')
title('Time series')

%----Part 5-----

% Input the 3x3 matrix describing your linear system as a variable A
a12 = 1;
a13 = 1/2;
a23 = 2;

A = [-a12-a13, a12,a13;
a12, -a12-a23, a23;
a13, a23, -a13-a23;]
% Input your initial conditions as a column vector x0
x0 = [1;0;1];
% Use eig(A) to find the eigenvalues and eigenvectors of A 
% Define the eigenvectors as column vectors v1, v2 and v3,
% and the eigenvalues as lambda1, lambda2, lambda3
% so that A*v1 = lambda1*v1, etc.
[V,D] = eig(A);
v1 = V(:,1);
v2 = V(:,2);
v3 = V(:,3);
d = diag(D);
lambda1 = d(1,1);
lambda2 = d(2,1);
lambda3 = d(3,1);
% Calculate the column vector c = [c1;c2;c3] from the initial conditions using inv(V)
c = inv(V) * x0;
c1 = c(1,1); c2 = c(2,1); c3 = c(3,1);
%%% Define a row vector t with 100 equally spaced entries, 
%%% beginning with 0 and ending at 4.
t = linspace(0,4, 100);
lam1t = exp(lambda1*t);
lam2t = exp(lambda2*t);
lam3t = exp(lambda3*t);
%%% Define three row vectors h1, h2 and h3, with entries corresponding 
%%% to h1(t), h2(t) and h3(t) evaluated at each time in t.
h1 = c1*lam1t*v1(1,1) + c2*lam2t*v2(1,1) + c3*lam3t*v3(1,1);
h2 = c1*lam1t*v1(2,1) + c2*lam2t*v2(2,1) + c3*lam3t*v3(2,1);
h3 = c1*lam1t*v1(3,1) + c2*lam2t*v2(3,1) + c3*lam3t*v3(3,1);
%%% Now use plot to plot the three vectors against time on the same figure
plot(t,h1)
hold on
plot(t,h2)
plot(t,h3)
set(gca,'fontsize',18)
xlabel('Time')
ylabel('Volume')
title('Time series')
axis square
%------Part 6------

% Input the 3x3 matrix describing your linear system as a variable A
A=[-1-1,1,0;
1,-2,1;
0,1,-1;];
% Input your initial conditions as a column vector x0
x0 = [1/2;0;1/2;]
% Use eig(A) to find the eigenvalues and eigenvectors of A 
% Define the eigenvectors as column vectors v1, v2 and v3,
% and the eigenvalues as lambda1, lambda2, lambda3
% so that A*v1 = lambda1*v1, etc.
[V,D] = eig(A);
v1 = V(:,1);
v2 = V(:,2);
v3 = V(:,3);
d = diag(D);
lambda1 = d(1,1);
lambda2 = d(2,1);
lambda3 = d(3,1);
% Calculate the column vector c = [c1;c2;c3] from the initial conditions using inv(V)
c = inv(V) * x0;
c1 = c(1,1); c2 = c(2,1); c3 = c(3,1);
%%% Define a row vector t with 100 equally spaced entries, 
%%% beginning with 0 and ending at 4.
t = linspace(0,4, 100);
lam1t = exp(lambda1*t);
lam2t = exp(lambda2*t);
lam3t = exp(lambda3*t);
%%% Define three row vectors h1, h2 and h3, with entries corresponding 
%%% to h1(t), h2(t) and h3(t) evaluated at each time in t.
h1 = c1*lam1t*v1(1,1) + c2*lam2t*v2(1,1) + c3*lam3t*v3(1,1);
h2 = c1*lam1t*v1(2,1) + c2*lam2t*v2(2,1) + c3*lam3t*v3(2,1);
h3 = c1*lam1t*v1(3,1) + c2*lam2t*v2(3,1) + c3*lam3t*v3(3,1);
%%% Now use plot to plot the three vectors against time on the same figure
plot(t,h1)
hold on
plot(t,h2)
plot(t,h3)
set(gca,'fontsize',18)
xlabel('Time')
ylabel('Volume')
title('Time series')