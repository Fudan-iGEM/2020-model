
tspan=[0 400];
y0=[1,1e-3];
[t,y]=ode45(@odefun,tspan,y0);

% plot(y(:,1),y(:,2),'LineWidth', 2)
% xlabel('AHL concentration/nM','FontSize',12);
% ylabel('cell concentration/nM','FontSize',12);
% title('Dynamic Stability1','FontSize',12)

plot(t,y(:,1),'LineWidth', 2)
hold on
plot(t,y(:,2),'LineWidth', 2)
xlabel('t','FontSize',12);
legend('AHL concentration','cell concentration/nM','FontSize',12);
title('Dynamic Stability2','FontSize',12)

function dy=odefun(t,y)
    alpha_AHL=0.167;
    alpha=1.1030;
    miu=0.0038;
    k_a_t=1;

    dy=[(alpha_AHL*y(2)-miu)*y(1);
    (alpha-k_a_t*y(1))*y(2)];
end
