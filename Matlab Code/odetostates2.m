%Panteleimon Manouselis AEM:9249
%Function created for Second Exercise of Intelligent and Adaptive Systems
function dxdt = odetostates2(t,x) %r is the input
%Unknown Parameters:
thita1=-0.018;
thita2=0.015;
thita3=-0.062;
thita4=0.009;
thita5=0.021;
thita6=0.75;
%Input
r=Input_r(t);
gamma=100; % Parameter affects speed of convergence

%Defining known matrices
F=[x(1)^3;abs(x(1))*x(2);abs(x(2))*x(2)];  %x(1)=x1, x(2)=x2

B=[0;1];
% P=[1.4143 0.5;0.5 0.7143];
P=[14.1429 5;5 7.1429];

Aref=[0 1;-1 -1.4];
Bref=[0;1];

%Control law
u=-[x(3) x(4)]*[x(1);x(2)]+x(5)*r-[x(6);x(7);x(8)]'*F;

%Error
e=[x(1);x(2)]-[x(9);x(10)];

%K(t) is made of k(1),k(2)
%L(t) is made of l(1)
%Thita(t) apoteleitai apo m(1),m(2),m(3)

dxdt=zeros(10,1);
dxdt(1) = x(2);%x_1 dot
dxdt(2)=thita1*x(1)+thita2*x(2)+thita3*abs(x(1))*x(2)+thita4*abs(x(2))*x(2)+thita5*x(1)^3+thita6*u;%x_2 dot

%K (k1,k2) k1=x(3), k2=x(4)
dxdt(3:4)=gamma*B'*P*e*[x(1);x(2)]'*sign(thita6); %sign(thita6) is simply equal to 1 

%L (l1) l1=x(5)
dxdt(5)=-gamma*B'*P*e*r'*sign(thita6);

%Thita_hat (m1,m2,m3) m1=x(6),m2=x(7),m3=x(8)

dxdt(6:8)= gamma*B'*P*e*F'*sign(thita6);

%X reference (xref1,xref2) xref1=x(9),xref2=x(10)
dxdt(9:10)=Aref*[x(9);x(10)]+Bref*r;
end