% ADK模型的相关计算
% Atom = H
clear all
clc

Zc = 1;
Ip = 0.5 ;     %H的电离能eV
%Ip = Ip*1.6*10^(19);
l = 0;         %H的轨道角量子数，s态 l=0
a1 = 0.16178;
a2 = -1.50441;
a3 = 0.32127;
C_l = 3.13;             %隧穿区电子波函数的振幅

k = sqrt(2.*Ip);
Eb = k.^4./(16.*Zc);

kE = 0.4:0.01:4.5;
E = Eb.*kE;

kk = 2.*Zc./(k-1);
%W_ADK = C_l.^2./2.*(1/(k.^kk)).*(2.*k.^3./E).^kk.*exp(-2.*k.^3./(3.*E));
W_ADK = C_l.^2.*exp(-2./(3.*E))./E;

%% Tong and Lin
arf = 6;
W_TL = exp(-arf.*(1/Ip).*(E./(k.^3))).*W_ADK;

%% Our work
%kE = E./Eb;
W_M = exp(-(a1.*kE.^2+a2.*kE+a3)).*W_ADK;
%plot(kE,W_ADK,'-k',kE,W_TL,'-b')
plot(kE,log10(W_ADK),'-k',kE,log10(W_TL),'-b')
hold on 
%plot(kE,W_M,'-r')
legend('ADK','Tong-Lin','Ourwork')