%Panteleimon Manouselis AEM:9249
%Script created for Second Exercise of Intelligent and Adaptive Systems
%% Controller_Gain_Plotter
% Predicted phi vs Actual phi
figure
subplot(1,3,1)
plot(t, x(:, 1));
hold on
grid on
title('${\phi}$ (i.e. ${x}_{1}$) for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${\phi} [rad]$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(1, 3, 2);
plot(t, x(:, 9));
grid on
ylabel('${\phi}_{ref}[rad]$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')
title('${\phi}_{ref}$ (i.e. ${x}_{1,ref}$) for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')

subplot(1,3,3)
plot(t,r)
hold on
grid on
ylabel('${r}(t)$','Interpreter','Latex')
xlabel('t (sec)','Interpreter','Latex')
title('Reference Input (i.e {r})','Interpreter','latex')

% Predicted rho vs Actual rho
figure
subplot(1,2,1)
plot(t, x(:, 2));
hold on
grid on
title('${\rho}$ (i.e. ${x}_{2}$) for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${\rho}[rad/s]$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(1,2,2)
plot(t, x(:, 10));
hold on
grid on
ylabel('${\rho}_{ref}[rad/s]$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')
title('${\rho}_{ref}$ (i.e. ${x}_{2,ref}$) for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')

% Error
% Error for calculating phi (i.e the output y)
e_phi=x(:,1)-x(:,9);

figure
subplot(1,2,1)
plot(t, e_phi);
hold on
grid on
title('${e}_{\phi}$ (i.e. Tracking Error for ${\phi}$) for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${e}_{\phi}[rad]$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

% Error for calculating rho (i.e the angular speed)
e_rho=x(:,2)-x(:,10);

subplot(1,2,2)
plot(t, e_rho);
hold on
grid on
title('${e}_{\rho}$ (i.e. Tracking Error for ${\rho}$) for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${e}_{\rho}[rad/s]$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

% Plotting The Controller
F=[x(:,1).^3 abs(x(:,1)).*x(:,2) abs(x(:,2)).*x(:,2)];
u=-x(:,3).*x(:,1)-x(:,4).*x(:,2)+x(:,5).*r-x(:,6).*F(:,1)-x(:,7).*F(:,2)-x(:,8).*F(:,3);

figure
plot(t,u)
hold on
grid on
ylabel('$U(t)$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')
title('Control Input U for $Zero$ $initial$ $conditions$',  'Interpreter', 'latex')
hold off
% Another way to create output
%[dydx, u2] = odetostates2(t, x); %Change in odetostates2 as well
%figure; plot(t,u2)


%% Erotima e(part 2) Adaptive gains of controller

%Ideal controller gain K_ideal: A-thita6*B*K_ideal=Aref therefore
%B*K_ideal=(Aref-A)*(1/-thita6)
Aref=[0 1;-1 -1.4];
Bref=[0;1];
thita1=-0.018;
thita2=0.015;
thita3=-0.062;
thita4=0.009;
thita5=0.021;
thita6=0.75;
B=[0;1];
A=[0 1;thita1 thita2];
%AX=B
K_ideal = linsolve(B,((Aref-A)*(1/-thita6)));

%K(t) vs K*
figure
subplot(2,3,1)
plot(t,x(:,3)) % Plotting k1 where K=[k1 k2]
hold on
grid on
title('${k}_{1}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${k}_{1}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(2,3,2)
plot(t,K_ideal(1)*ones(size(t))) % Plotting k1_ideal where K*=[k1_ideal k2_ideal]
hold on
grid on
title('${k}_{1,ideal}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${k}_{1,ideal}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(2,3,3)
plot(t,x(:,3),t,K_ideal(1)*ones(size(t))) % Plotting k1_ideal and k1 together
hold on
grid on
title('${k}_{1,ideal}$ and ${k}_{1}$ plotted together',  'Interpreter', 'latex')
ylabel('${k}_{1}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')
legend('{k}_{1}','{k}_{1,ideal}')

subplot(2,3,4)
plot(t,x(:,4)) % Plotting k2 where K=[k1 k2]
hold on
grid on
title('${k}_{2}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${k}_{2}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(2,3,5)
plot(t,K_ideal(2)*ones(size(t))) % Plotting k1 where K=[k1 k2]
hold on
grid on
title('${k}_{2,ideal}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${k}_{2,ideal}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(2,3,6)
plot(t,x(:,4),t,K_ideal(2)*ones(size(t))) % Plotting k2_ideal and k2 together
hold on
grid on
title('${k}_{2,ideal}$ and ${k}_{2}$ plotted together',  'Interpreter', 'latex')
ylabel('${k}_{2}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')
legend('{k}_{2}','{k}_{2,ideal}')



%Ideal controller gain L_ideal: thita6*B*L_ideal=Bref therefore
%B*L_ideal=Bref*(1/thita6)
L_ideal = linsolve(B,(Bref*(1/thita6)));

%L(t) vs L*
figure
subplot(1,3,1)
plot(t,x(:,5)) % Plotting l1 where L(t)=l1
hold on
grid on
title('${L(t)}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${L}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(1,3,2)
plot(t,L_ideal*ones(size(t))) % Plotting L1_ideal
hold on
grid on
title('${L}_{ideal}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${L}_{ideal}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(1,3,3)
plot(t,x(:,5),t,L_ideal*ones(size(t))) % Plotting L1_ideal and  L(t) together
hold on
grid on
title('${L}_{ideal}$ and ${L(t)}$ plotted together',  'Interpreter', 'latex')
ylabel('${L}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')
legend('L(t)','L_{ideal}')



%Controller parameter (not gain) Θ_actual:
Thita_ideal=(1/thita6).*[thita5;thita3;thita4];

%Thita_hat vs Thita_actual
figure
subplot(1,3,1)
plot(t,x(:,6))
hold on
grid on
title('$\hat{{\Theta}}_{1}{(t)}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('$\hat{{\Theta}}{[1]}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(1,3,2)
plot(t,Thita_ideal(1)*ones(size(t)))
hold on
grid on
title('${\Theta}{[1]}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${\Theta}{[1]}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(1,3,3)
plot(t,x(:,6),t,Thita_ideal(1)*ones(size(t)))
hold on
grid on
title('$\hat{{\Theta}}_{1}{(t)}$ and ${\Theta}{[1]}$ plotted together',  'Interpreter', 'latex')
ylabel('$\hat{{\Theta}}_{1}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')
legend('$\hat{{\Theta}}_{1}$','${\Theta}{[1]}$','Interpreter','latex')


figure
subplot(1,3,1)
plot(t,x(:,7))
hold on
grid on
title('$\hat{{\Theta}}_{2}{(t)}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('$\hat{{\Theta}}{[2]}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(1,3,2)
plot(t,Thita_ideal(2)*ones(size(t)))
hold on
grid on
title('${\Theta}{[2]}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${\Theta}{[2]}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(1,3,3)
plot(t,x(:,7),t,Thita_ideal(2)*ones(size(t)))
hold on
grid on
title('$\hat{{\Theta}}_{2}{(t)}$ and ${\Theta}{[2]}$ plotted together',  'Interpreter', 'latex')
ylabel('$\hat{{\Theta}}_{2}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')
legend('$\hat{{\Theta}}_{2}$','${\Theta}{[2]}$','Interpreter','latex')

figure
subplot(1,3,1)
plot(t,x(:,8))
hold on
grid on
title('$\hat{{\Theta}}_{3}{(t)}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('$\hat{{\Theta}}{[3]}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(1,3,2)
plot(t,Thita_ideal(3)*ones(size(t)))
hold on
grid on
title('${\Theta}{[3]}$ for $zero$ $initial$ $conditions$',  'Interpreter', 'latex')
ylabel('${\Theta}{[3]}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')

subplot(1,3,3)
plot(t,x(:,8),t,Thita_ideal(3)*ones(size(t)))
hold on
grid on
title('$\hat{{\Theta}}_{3}{(t)}$ and ${\Theta}{[3]}$ plotted together',  'Interpreter', 'latex')
ylabel('$\hat{{\Theta}}_{3}$', 'Interpreter', 'latex')
xlabel('t (sec)', 'Interpreter', 'latex')
legend('$\hat{{\Theta}}_{3}$','${\Theta}{[3]}$','Interpreter','latex')