%Numerically solve DE and time how long it takes
x0 = -2;                               %The initial condition, x(0)
tspan = [0,2];                        %The time interval, tspan
tic;                                  %Start timer
[t,x] = ode45(@(t,x) t*x^2,tspan,x0); %Use ODE45 to compute numerical solution
timeElapsed = toc;                    %Stop timer
disp(['It took ODE45 ',num2str(timeElapsed,3), ' seconds to compute the solution']);

%Enter analytic solution
xTrue = -2./(1+t.^2);

%Plot results
%You do not need to edit any of the code below which creates the plots for you.
figure(1)
plot(t,x,'bo','markersize',10); hold on;
plot(t,xTrue,'r','linewidth',3);
legend('Numerical Solution','Exact Solution','location','northwest');
xlabel('$t$','interpreter','latex'); ylabel('$x(t)$','interpreter','latex')
title('Comparison of Solutions','interpreter','latex')
set(gca,'fontsize',25)

figure(2)
plot(t,abs(x-xTrue)./xTrue,'ro-','linewidth',3,'markersize',10); 
xlabel('$t$','interpreter','latex'); ylabel('$|x(t)-x_{true}|/x_{true}$','interpreter','latex')
title('Relative Error','interpreter','latex')
set(gca,'fontsize',25)