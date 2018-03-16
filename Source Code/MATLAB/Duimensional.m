function Duimensional 
    tmax=100;
    %initial = [0.2 0.2 0.02 0.1 0.1 0.1 0.1];  % initial population
    initial = [0.2 0.2 0.02 0.1 0.1 0.1 0.1];
    [t1,y] = ode45(@simulation,[0 tmax],initial);
    t=t1;
   plot(t,y(:,1),'r',t,y(:,2),'',t,y(:,3),'k',t,y(:,4),'g',t,y(:,5),'--m',t,y(:,6),'--b',t,y(:,7),'--g','LineWidth',1.5);
    xlabel('Time');
    ylabel('Scaled population');
    legend('S1','I1','Q1','R1','I2','B2','R2');
    function dy= simulation(t,y)
    m1=0;                                                                           %antivirus and firewall security coefficient
    m2=0;
    dy=zeros(7,1);
    b=75;
      d1=0.3;                                             % d1,d3: natural death rate of non-infected nodes;
    d3=2;
    beta1 =2.5; beta2 = 0.6 ;eta =0.4 ;mu = 0.3;alpha = 1.0;         %parameters for targetted class
    d2 = 0.4; lambda = 0.8;
    b1=75; 
    theta = 10; eta1 = 7.5;          %parameters for attacker class
    d4 = 2.5; gamma = 0.75; delta = 0.9;
    %Basic Reproduction number
    R=beta1/(d2+eta+mu)
    %equation
    dy(1)= b-d1*y(1)+alpha*y(4)- beta1*exp(-m1*y(2)/(y(1)+y(2)+y(3)+y(4)))*y(1)*y(2)/(y(1)+y(2)+y(3)+y(4))- beta2*exp(-m2*y(6)/(y(5)+y(6)+y(7)))*y(1)*y(6)/(y(5)+y(6)+y(7)) ;
    dy(2)= beta1*exp(-m1*y(2)/(y(1)+y(2)+y(3)+y(4)))*y(1)*y(2)/(y(1)+y(2)+y(3)+y(4))+ beta2*exp(-m2*y(6)/(y(5)+y(6)+y(7)))*y(1)*y(6)/(y(5)+y(6)+y(7))- d2*y(2)-mu*y(2)-eta*y(2) ;
    dy(3)= mu*y(2)-d2*y(3)-lambda*y(3);
    dy(4)= eta*y(2)-alpha*y(4)-d1*y(4)+lambda*y(3) ;
    dy(5)= b1-d4*y(5)-delta*y(5)+theta*y(7)-eta1*y(5) ;
    dy(6)= delta*y(5)-d4*y(6)-gamma*y(6);
    dy(7)= gamma*y(6)-d3*y(7)-theta*y(7)+eta1*y(5);
end
end