%Numerically solve DE and time how long it takes
%x'' + 2x' + x = 0 
x0 = [0;1];
tspan = [0,5];
A = [0,1;-1,-2];
tic;
f = @(t,x) [x(2); -2*x(2) - x(1)];
[t,x] = ode45(f ,tspan,x0);
timeElapsed = toc;
disp(['It took ODE45 ',num2str(timeElapsed,3), ' seconds to compute the solution']);

%Enter analytic solution (Hint: it is in the text above.)
xTrue = t.*exp(-t)

%Plot results
%Do not edit the code below.
figure(1)
plot(t,x(:,1),'bo','markersize',10); hold on;
plot(t,xTrue,'r','linewidth',3);
legend('Numerical Solution','Exact Solution','location','northeast');
xlabel('$t$','interpreter','latex'); ylabel('$x(t)$','interpreter','latex')
title('Comparison of Solutions','interpreter','latex')
set(gca,'fontsize',25)

figure(2)
plot(t,abs(x(:,1)-xTrue)./xTrue,'r','linewidth',3); 
xlabel('$t$','interpreter','latex'); ylabel('$|x(t)-x_{true}|/x_{true}$','interpreter','latex')
title('Relative Error','interpreter','latex')
set(gca,'fontsize',25)