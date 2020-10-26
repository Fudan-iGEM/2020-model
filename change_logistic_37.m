tspan=[0,6,12,24,30];
y0=50.33333;
r=0.079;
K=0.079/475;
delta=inf;
for alpha=0.5:0.001:5
    [t,y] = ode45(@(t,y) r*y-K*y^2-alpha,tspan,y0);
    tt3=[50.33333,50.66667,64.33333,169.66667,232.33333];
    delta1=sum((y-tt3').^2);
    if delta1<delta
        delta=delta1;
        alpha_=alpha;
    end
end
tspan2=[0 30];
[t,y] = ode45(@(t,y) r*y-K*y^2-alpha_,tspan2,y0);
plot(t,y,'LineWidth', 2)
hold on
plot(tspan,tt3,'o')
legend('Fit','Experiment')
xlabel('time/h','FontSize',12);
ylabel('Relative Population Density','FontSize',12);
title('Control Group','FontSize',12)
