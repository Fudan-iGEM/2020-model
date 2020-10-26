tspan=[0,6,12];
y0=50.33333;
r=0.079;
K=0.079/475;
delta=inf;
for alpha=0:0.001:5
    [t,y] = ode45(@(t,y) r*y-(K+alpha)*y^2,tspan,y0);
    tt3=[50.66667,23,23.66667];
    delta1=sum((y-tt3').^2);
    if delta1<delta
        delta=delta1;
        alpha_=alpha;
    end
end
tspan2=[0 20];
[t,y1] = ode45(@(t,y) r*y-(K+alpha_*0.394639/0.10236)*y^2,tspan2,y0);
plot(t,y1,'LineWidth', 2)
hold on
[t,y2] = ode45(@(t,y) r*y-(K+alpha_)*y^2,tspan2,y0);
plot(t,y2,'LineWidth', 2)
hold on
[t,y3] = ode45(@(t,y) r*y-(K)*y^2,tspan2,y0);
plot(t,y3,'LineWidth', 2)
legend('New(BBa_K3606027 at 30℃)','Old(BBa_K3036004 at 27℃)','Control Group')
hold on
xlabel('Time/h','FontSize',12);
ylabel('Relative Population Density','FontSize',12);
title('Kill switch','FontSize',12)