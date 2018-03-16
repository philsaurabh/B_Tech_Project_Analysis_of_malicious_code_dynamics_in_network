function Normalized 
    d1=0.003;                                             % d1,d3: natural death rate of non-infected nodes;
    d3=0.02;
    tmax=20000*d1;
    %initial = [0.02 0.02 0.01 0.01 0.02 0.02 0.02];       % initial population
    initial = [0.4 0.2 0.02 0.2 0.50 0.25 0.25];
    [t1,y] = ode45(@simulation,[0 tmax],initial);
    t=t1/d1;
    %plot(t,y);
   plot(t,y(:,1),'r',t,y(:,2),'',t,y(:,3),'k',t,y(:,4),'g',t,y(:,5),'--m',t,y(:,6),'--b',t,y(:,7),'--g','LineWidth',1.5);
%   %plot(t,y(:,2),'r',t,y(:,3),'LineWidth',2.5);
    xlabel('Time');
    ylabel('Scaled population');
    legend('S1','I1','Q1','R1','I2','B2','R2');
    function dy= simulation(t,y)
    %Antivirus and Firewall Coefficients
    m1=2;                                                 
    m2=3;
    dy=zeros(7,1);
    b=7.5;
    beta1 = 0.001/d1; beta2 = 0.006/d1 ;eta = 0.004/d1 ;mu = 0.003/d1;alpha = 0.010/d1;         %parameters for targeted class
    d2 = 0.4/d1; lambda = 0.008/d1;
    b1=7.5; 
    theta = 0.10/d3; eta1 =0.175/d3;          %parameters for attacker class
    d4 = 0.075/d3; gamma = 0.0005/d3; delta = 0.009/d3;
    %Reproduction Number
    R=(beta1+1)/(d2+mu+eta+1)
    R1=1/(d2+lambda+1)
    %equations
    dy(1)= 1-2*y(1)+alpha*y(4)- beta1*exp(-m1*y(2))*y(1)*y(2)- beta2*exp(-m2*y(6))*y(1)*y(6)+y(1)*y(1)+d2*y(1)*y(2)+d2*y(1)*y(3)+y(1)*y(4) ;
    dy(2)= beta1*exp(-m1*y(2))*y(1)*y(2)+ beta2*exp(-m2*y(6))*y(1)*y(6)- y(2)-mu*y(2)-eta*y(2)-d2*y(2)+d2*y(3)*y(2)+d2*y(2)*y(2)+y(1)*y(2)+y(4)*y(2) ;
    dy(3)= mu*y(2)-y(3)-lambda*y(3)-d2*y(3)+y(3)*y(1)+y(3)*y(4)+d2*y(3)*y(3)+d2*y(2)*y(3);
    dy(4)= eta*y(2)-alpha*y(4)-2*y(4)+lambda*y(3)+y(4)*y(1)+y(4)*y(4)+d2*y(4)*y(2)+d2*y(4)*y(3) ;
    dy(5)= 1-y(5)-delta*y(5)+theta*y(7)-eta1*y(5)-d4*y(5)+d4*y(5)*y(5)+d4*y(5)*y(6)+y(5)*y(7) ;
    dy(6)= delta*y(5)-y(6)-gamma*y(6)-d4*y(6)+d4*y(6)*y(6)+d4*y(5)*y(6)+y(6)*y(7);
    dy(7)= gamma*y(6)-2*y(7)-theta*y(7)+eta1*y(5)+d4*y(5)*y(7)+d4*y(6)*y(7)+y(7)*y(7);
end
end