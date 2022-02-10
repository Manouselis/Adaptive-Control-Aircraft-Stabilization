%Panteleimon Manouselis 
%Script created for Second Exercise of Intelligent and Adaptive Systems
%Main Script
%% Erotima a
tic
clc
clear all
numlinspacex=20;
numlinspacey=10;
[x1, x2] = meshgrid(linspace(-numlinspacex, numlinspacex, 30), linspace(-numlinspacey, numlinspacey, 30)); %dimiourgoume ena didiastato grid 
%linspace xrisimopoeieitai gia na dimiourgisoume n simia metaksi ton dio
%diastimatwn
dx1 = zeros(30,30); % zero matrice sized 30*30
dx2 = zeros(30,30);
t=0;
for i = 1:numel(x1) %numel is the number of elements in array x1
    Yprime = odetostates(t,[x1(i); x2(i)]);
    dx1(i) = Yprime(1);
    dx2(i) = Yprime(2);
end
% in the for loop which runs 900 times we calculate for t=0 the value of
%the state equations at the positions x1=x1(i)
%and x2=x2(i) thus we get a 2*1 matrix with the values dx1(i)/dt and
%dx2(i)/dt (i.e the state equations solved 900 times for 30*30 locations of
%the graph ) The value is given to the 2*1 matrix Yprime and then passed on
%to the  . Those locations are then portrayed as arrows with the below
%command where the position of the arrows in the graph are given by x1 and
%x2 and the vector of the arrow by dx1 and dx2

%Plotter
figure

quiver(x1,x2,dx1,dx2);

xlim([-numlinspacex numlinspacex]); % we limit the line of the x-axis that shows up on the graph
ylim([-numlinspacey numlinspacey]);
title('Phase Portrait for different Initial Conditions', 'Interpreter', 'latex');
xlabel('${\phi}[rad]$', 'Interpreter', 'latex');
ylabel('${\rho}[rad/s]$', 'Interpreter', 'latex');
grid on
hold on

% Steady State Initial Conditions for the States
x0 =[[0.15 0.4 -1]; [0.2 0.35 1]];

%Other equilibriumm point:(+-0.9258200998,0)

for i=1:3
    [t, x] = ode45(@odetostates, [0 50], x0(:, i));
    %     for j=1:length(x)
    %         x(j,1)=rem(x(j,1),pi);
    %     end
    temp=plot(x(:, 1), x(:, 2), x0(1, i), x0(2, i), 'xr');
    plothandles(i)=temp(1);
    hold on
end
h=plot(0,0,'Marker','+','LineWidth',1,'MarkerSize',10); %Plotting the equilibrium point
ylim([-10 10])
xlim([-20 20])
lgd=legend([plothandles h],{'X(0)=(0.15,0.2)','X(0)=(0.4,0.35)','X(0)=(-1,1)','Equilibrium Point (0,0)'});
title(lgd,'Initial Conditions and Equilibrium Point')
hold off

%% Erotima b

clc
clear all
[x1, x2] = meshgrid(linspace(-1, 1, 30), linspace(-0.25, 0.25, 30)); %dimiourgoume to didiastato grid 
dx1 = zeros(30,30); % zero matrice sized 30*30
dx2 = zeros(30,30);
t=0;
for i = 1:numel(x1)
    Yprime = odetostates(t,[x1(i); x2(i)]);
    dx1(i) = Yprime(1);
    dx2(i) = Yprime(2);
end
%leinoume eksisosi katastasewn gia kathe simeio tou grid etsi wste na
%dimiourgisoyme to quiver

%Plotter
figure
quiver(x1,x2,dx1,dx2);
xlim([-1 1]); % we limit the line of the x-axis that shows up on the graph
ylim([-0.25 0.25]);
title('Phase Portrait for different Initial Conditions', 'Interpreter', 'latex');
xlabel('${\phi}[rad]$', 'Interpreter', 'latex');
ylabel('${\rho}[rad/s]$', 'Interpreter', 'latex');
grid on
hold on

% Steady State Initial Conditions for the States
x0 =[[0.01 0.02 -0.1]; [0.01 0.02 -0.1]];
for i=1:3
    [t, x] = ode45(@odetostates, [0 700], x0(:, i));
    temp=plot(x(:, 1), x(:, 2), x0(1, i), x0(2, i), 'xr');
    plothandles(i)=temp(1);
    hold on
end
h=plot(0,0,'Marker','+','LineWidth',1,'MarkerSize',10); %Plotting the equilibrium point
lgd=legend([plothandles h],{'X(0)=(0.01,0.01)','X(0)=(0.02,0.02)','X(0)=(-0.1,0.1)','Equilibrium Point'});
title(lgd,'Initial Conditions and Equilibrium Point')
hold off

% Erotima e
clc
clear all
%We find matrice P which shall verify the equation P*Aref+Aref'*P=-Q, Q=Q'>0,P=P'>0
%Solve Sylvester equation AX + XB = C for X
%P*Aref+Aref'*P=-eye(2)
%Aref'*P+P*Aref=-eye(2)
Aref=[0 1;-1 -1.4];
P = sylvester(Aref',Aref,-10*eye(2));
%Check that P is positive definite and symmetric
eig(P) %eigenvalues of P

%% Plotting with First input r

% Steady State Initial Conditions for the States
x0=zeros(10,1);
% x0(1)=3*pi/180;
% x0(2)=4*pi/180;
options = odeset('RelTol',1e-8,'AbsTol',1e-10,'MaxStep',0.01);
%Max step=0.01 command is needed since the ode is inititally jumping from
%t=0 to t=14 and thus is not producing the correct output for r (and other
%variables)
[t, x]= ode23s(@odetostates2,[0 140],x0,options);

%Input r
r=zeros(length(t),1);
for i=1:length(t)
    r(i)=Input_r(t(i));
end
%Plotting
Plotter_Gains

%% Plotting with second input r

x0=zeros(10,1);

options = odeset('RelTol',1e-8,'AbsTol',1e-10,'MaxStep',0.01);
[t, x]= ode23s(@odetostates3,[0 140],x0,options);

r=zeros(size(t));
r=0.1745.*sin(t);
%Plotting
Plotter_Gains
toc
