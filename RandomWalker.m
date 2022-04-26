Random walkers set up

Suppose we dump 1000 random walkers into node 1 of a 10 node one dimensional graph at t=0. At each time step ?t, a random walker has an equal probability of moving one step to the right, one step to the left, or staying stationary. (At the end points it has a 2/3 probability of staying stationary and a 1/3 probability moving to the adjacent node.) Because we allow the random walker to stay stationary, we call this a lazy random walker. Random walkers cannot move beyond adjacent nodes.

Create a matrix A whose i th column lists probabilities aj,i for a random walker in node i to get to node j over one time step. (Such a matrix is called a Markov matrix. A Markov matrix is a square matrix with nonnegative entries such that the sum of the entries in each column is 1. This is equivalent to the property that no matter what the starting distribution, the expected number of particles is conserved, even though these expectations are fractions of particles.)

The number of random walkers at node i at time t=0 is ci. Store the initial value of walkers in a column vector

c0=[c1; c2; c3; c4; c5; c6; c7; c8; c9; c10]

Create a Matrix A (markov, hint in maybe useful to look up the matlab documentation on diagnoal and tridiagonal matrices.)

Create a  column vector of the initial state in a vector called c0

This i figured out which was correct:  c0 = [1000;0;0;0;0;0;0;0;0;0]

What is the expected distribution of walkers after one time step in a vector? call this vector x1.

What is the expected distribution of walkers after two time steps in a vector? call this vector x2.

What is the expected distribution of walkers after 9 time steps in a vector? call this vector x9.

%Enter the matrix A. (Hint it may be useful to look up the 
%matlab documentation on diagonal and tridiagonal matrices.)
N = 10;
A = diag(1/3 * ones(1, N)) + diag(1/3 * ones(1, N-1), 1) + diag(1/3 * ones(1, N-1), -1);
% Modify the probabilities at the end-points
A(1, 1) = 2/3;
A(N, N) = 2/3;

% create initial vector
c0 = zeros(N, 1)
c0(1, 1) = 1000

x1 = A * c0
x2 = A^2 * c0
x9 = A^9 * c0
%Enter column vector of the initial state in a vector called c0.
