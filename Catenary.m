%Read image
I = imread('free.jpg');

L = [0.1384,2.67];  %(x,y) coordinate of left endpoint of cable
R = [5.644,1.62]; %(x,y) coordinate of right endpoint of cable
len = 6.38;      %length of cable 

%Show image and indicate endpoints
imagesc([0,5.7736],[0,3.2477],flipud(I));set(gca,'YDir','normal');
axis equal; ylim([[0,3.2477]]); xlim([0,5.7736]); box on; hold on;
xlabel('$x$ (meters)','interpreter','latex'); ylabel('$y$ (meters)','interpreter','latex');
plot(L(1),L(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);
plot(R(1),R(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);

%Define system of 3 equations to solve (c is vector containing 3 unknowns)
% Set F1 to be the function that guarantees the left endpoint boundary condition.
F1 = @(c) c(3) + c(2)*cosh((L(1)-c(1))/c(2)) - L(2)  %%Catenary passes through left endpoint
% Set F2 to be the function that guarantees the right endpoint boundary condition.
F2 = @(c) c(3) + c(2)*cosh((R(1)-c(1))/c(2)) - R(2)  %%Catenary passes through right endpoint
F3 = @(c) c(2)*(sinh((R(1)-c(1))/c(2))-sinh((L(1)-c(1))/c(2))) - len;  %Arc length is constant value len
cOut = fsolve(@(c) [F1(c);F2(c);F3(c)],[-1,1,1]); %[-1,1,1] is initial guess for [c(1),c(2),c(3)] 
%negative sign ensures that we choose the lower of two possible catenarys

%Plot theoretical shape of cable
xPlot = linspace(L(1),R(1),50);
yPlot = cOut(3) + cOut(2)*cosh((xPlot-cOut(1))/cOut(2));
plot(xPlot,yPlot,'r:','linewidth',2,'markersize',10);
set(gcf, 'Position', [10 10 1000 1000]);