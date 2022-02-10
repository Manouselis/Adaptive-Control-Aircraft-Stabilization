%Panteleimon Manouselis 
%Function created for Second Exercise of Intelligent and Adaptive Systems
function dxdt = odetostates(t,x)
%Parameters
thita1=-0.018;
thita2=0.015;
thita3=-0.062;
thita4=0.009;
thita5=0.021;
thita6=0.75;
% x(1)=rem(x(1),pi);
%Input
u=0;
dxdt=zeros(2,1);
dxdt(1) = x(2);
dxdt(2)=thita1*x(1)+thita2*x(2)+(thita3*abs(x(1))+thita4*abs(x(2)))*x(2)+thita5*(x(1)^3)+thita6*u;
end
