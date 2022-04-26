%Read image
I = imread('down.jpg');

%Endpoints
L = [0.1464,2.533]; %(x,y) coordinate of left endpoint of cable
R = [5.366,1.522]; %(x,y) coordinate of right endpoint of cable
M = [2.492,0.6204]; %(x,y) coordinate of rider
len = 6.095;     %length of cable 
 
%Show image and indicate endpoints and rider
imagesc([0,5.5098],[0,3.0993],flipud(I));set(gca,'YDir','normal');
axis equal; ylim([[0,3.0993]]); xlim([0,5.5098]); box on; hold on;
xlabel('$x$ (meters)','interpreter','latex'); ylabel('$y$ (meters)','interpreter','latex');
plot(L(1),L(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);
plot(R(1),R(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);
plot(M(1),M(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);

%Define system of 6 equations to solve (c is vector containing 6 unknowns)
F1 = @(c) c(3) + c(2)*cosh((L(1)-c(1))/c(2)) - L(2); %Left cable must pass through left endpoint L
F2 = @(c) c(3) + c(2)*cosh((M(1)-c(1))/c(2)) - M(2); %Left cable must pass through rider at M
F3 = @(c) c(6) + c(5)*cosh((M(1)-c(4))/c(5)) - M(2); %Right cable must pass through rider at M
F4 = @(c) c(6) + c(5)*cosh((R(1)-c(4))/c(5)) - R(2); %Right cable must pass through right endpoint R
F5 = @(c) c(2)*(sinh((M(1)-c(1))/c(2))-sinh((L(1)-c(1))/c(2))) + c(5)*(sinh((R(1)-c(4))/c(5))-sinh((M(1)-c(4))/c(5))) - len; %Left + right arclength = total arclength
F6 = @(c) c(2)*cosh((M(1)-c(1))/c(2))- c(5)*cosh((M(1)-c(4))/c(5));  %Tension must be continuous at rider   
cOut = fsolve(@(c) [F1(c);F2(c);F3(c);F4(c);F5(c);F6(c)],[-1,1,1,-1,1,1]); 

%Plot theoretical shape of cable

%Left cable
xPlot = linspace(L(1),M(1),25);
yPlot = cOut(3) + cOut(2)*cosh((xPlot-cOut(1))/cOut(2));
plot(xPlot,yPlot,'r:','linewidth',4,'markersize',10);

%Right cable
xPlot = linspace(M(1),R(1),25);
yPlot = cOut(6) + cOut(5)*cosh((xPlot-cOut(4))/cOut(5));
plot(xPlot,yPlot,'b:','linewidth',4,'markersize',10);

%Straight lines for reference
plot([L(1),M(1)],[L(2),M(2)],'k','linewidth',2);