%We've set the values of a and mu as specified in the problem.
a = 1.0;
mu = 0.5;

%Enter the matrix A as defined above, the initial value x0,
%and create a row vector t of 400 equally spaced time values as t ranges from 0.5 to 1.5;
A = [-(a + mu),  a, 0; a, -2*a, a; 0 , a, -a];
x0 = [2/3;0;1/3;];
t = linspace(.5, 1.5, 400);
%At each time t, define x in terms of the exponential matrix expm(A_, t), and the
%initial value.
for m=1:length(t)
        x(:, m) = expm(A*t(m))*x0;
end
% get h1, h2, h3. from x.
h1 = x(1, :);
h2 = x(2, :);
h3 = x(3, :);

%Plot h1, h2 and h3.
plot(t, h1, t, h2, t, h3, 'LineWidth', 2)
set(gca, 'fontsize', 18)
legend('h1', 'h2', 'h3')
xlabel('Time')
ylabel('Volume')
title('Time Series')

% Determine the max of h2, and the index of the maximum value.
[h2max, h2max_pos] = max(h2)
% use the index to get the max value.
tmax = t(h2max_pos)

%----Part 2

A = [ -2 1 0; 1 -2 1; 0 1 -1];
x0 = [0.5;0;0.5];
t = linspace(0,4,100);
% Store the eigenvectors and eigenvalues in matrices V and D respectively.
[V,D] = eig(A)
%[V,D] = eigs(A,size(A,1))
%Define I to be the index of the largest eigenvalue of A. That is the largest eigenvalues is D(I,I).
% Hint try using sort() or max() and look into the MATLAB documentation for help.

%[D,ind] = sort(D)

I = [3] %diag(D)

% Defined lambda to be the maximum eigenvalue, and v to be the maximum eigenvector.

lambda = D(3,3)
v = V(:,3)
% 
C = inv(V)*x0;
c = C(I,1);
asymp = c*exp(lambda*t)*v(1,1);
% use the matrix exponential to find the solution for the given initial condition
for m=1:length(t)
    x(:,m) = expm(A*t(m))*x0;
end
%

plot(t,x(1,:))
hold on
plot(t,asymp)
legend('x','asymp')
set(gca,'fontsize',18)
xlabel('Time')
ylabel('Volume')