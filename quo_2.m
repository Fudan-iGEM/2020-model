clear all
AHL=0;  %nM
LuxR=10; %nM
LuxI=10; %nM
RA=0;   %nM
AHLprecursor=100;        %nM

alpha_AHL=0.167; %AHL production rate : nM/s
alpha_LuxR=0.0167; %LuxR production rate : nM/s
miu=0.0038; %substance dissolution rate : s-1

k_diff=1.83; % AHL transfer rate between invitro and invivio : s-1
k_RA_ON=0.03;
3; % AHL and LuxR combination rate : nM-1*s-1
k_RA_OFF=0.167; % LuxR&AHL complex decomposation rate : s-1 
c=[alpha_LuxR,alpha_LuxR,miu,miu,alpha_AHL,k_diff,k_RA_ON,k_RA_OFF];
x=[LuxI,LuxR,AHLprecursor,AHL,RA]';
S=[1,0,-1,0,-1,0,0,0;0,1,0,-1,0,0,-1,1;0,0,0,0,-1,0,0,0;0,0,0,0,1,0,-1,1;0,0,0,0,0,0,1,-1];
T=1;
[a,b]=size(S);
tlst=0;
RAlst=0;
for k=1:1:1e3
    hlist=[];
    for i=1:1:b
        if i==1||2
            hadd=c(i);
        end
        if i==3
            hadd=c(i)*x(1);
        end
        if i==4
            hadd=c(i)*x(2);
        end
        if i==5
            hadd=c(i)*x(1)*x(3);
        end
        if i==6
            hadd=c(i)*x(4);
        end
        if i==7
            hadd=c(i)*x(4)*x(2);
        end    
        if i==8
            hadd=c(i)*x(5);
        end
        hlist=[hlist,hadd];
    end

    h0=sum(hlist);
    tadd=exprnd(1/h0);
    hlist2=hlist./h0;

    for i=2:1:length(hlist2)
        hlist2(i)=hlist2(i)+hlist2(i-1);
    end
    p=rand;
    if p<hlist2(1)
        id = 1;
    else
        for t=1:1:length(hlist2)-1
            if p>=hlist2(t)&&p<=hlist2(t+1)          
                id=t+1;
            end

        end
    end
    RAlst=[RAlst,x(end)];
    x=x+S(:,id);
    tlst=[tlst,tlst(end)+tadd];
end
plot(tlst,RAlst)
xlabel('time/s','FontSize',12);
ylabel('Molecule Number','FontSize',12);
title('RA in a cell','FontSize',12)