load('Reference.mat')

%Define parameters 
m1 = 1;
m2 = 0.05;
k1 = 1;
k2 = 0.045; 
k2asterick = 0.045;
%.1 <-- no good
% with .020 Amplitude of building's oscillation: 1.47
% with .030 Amplitude of building's oscillation: 1.493
% with .040 Amplitude of building's oscillation: 1.518
% with .050 Amplitude of building's oscillation: 1.537
% with .045 8.5882
b1 = 0.001;
b2 = 0.015;
% 0.010 = 6.9796
% 0.015 = 6.6901
% 0.020 = 8.5882
% 0.025 = 10.6529
% 0.030 = 12.6897 
% 0.040 = 16.6424
% 0.050 = 20.4544
omSweep = linspace(0.7,1.3,50);

%Numerically solve DE at each forcing frequency

x0 = [0;0;0;0];
tvec = linspace(0,7000,35000);
A = [
    0,0,1,0;
    0,0,0,1;
    -(k1+k2)/m1, k2/m1, -(b1+b2)/m1, b2/m1;
    k2/m2, -k2/m2, b2/m2, -b2/m2;];


for i=1:length(omSweep)

    om = omSweep(i);
    
    %Copy code to solve DE here
    [t,x] = ode45(@(t,x) A * x + [0; 0; sin(om*t); 0], tvec, x0);
    %Compute steady state solution and extract building oscillation amplitude 
    lt = length(t);
    per = 2*pi/om;
    [~,idx] = min(abs(t-(t(end)-5*per)));
    ampBuilding(i) = max(x(idx:lt,1));
    

end

%Plot
plot(OmRef,ampRef,'r'); hold on;
plot(omSweep,ampBuilding,'k');
xlim([0.7,1.3]); ylabel('Max. Amp. of Building'); xlabel('$\Omega$');
legend('Without TMD','With TMD')
disp(['Amplitude of building''s oscillation: ',num2str(max(x(idx:lt,1)),4)])
disp(num2str(max(ampBuilding)))
disp(['Amplitude of building''s oscillation without TMD: ',num2str(max(ampRef),4)])