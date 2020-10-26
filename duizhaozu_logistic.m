tspan=[0,6,12,24,30];
y0=48;
delta=inf;
delta2=inf;
for sum0=200:1:500
    for r=0.005:0.001:0.3
        K=r/sum0;
        [t,y] = ode45(@(t,y) r*y-K*y^2,tspan,y0);

        tt=[49,40.33333,70,233.66667,233];
        tt2=[48.66667,54,92,221,251.3333];

        delta1=sum((tt2-y').^2);
        if delta1<delta
            rr=r;
            delta=delta1;
        end
    end
    if delta<delta2
        sumsum=sum0;
        delta2=delta;
    end
end
tspan2=[0 30];
[t2,y2] = ode45(@(t,y) rr*y-rr/sumsum*y^2,tspan2,y0);
plot(t2,y2)
hold on
plot(tspan,tt2,'o')


