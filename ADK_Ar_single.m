% 单个场强计算-Ar原子
% ADK模型的相关计算
% Atom = Ar
clear all
clc

Zc = 1;
Ip = 0.579;     % Ar的电离能eV
l = 1;          % Ar的轨道角量子数，p态 l=1
a1 = 0.16178;
a2 = -1.50441;
a3 = 0.32127;
C_l = 2.44;             %隧穿区电子波函数的振幅

k = sqrt(2.*Ip);
Eb = k.^4./(16.*Zc);
kE = 0.5;
E = Eb.*kE;

kk = 2.*Zc./k-1;
W_ADK = (2.*l+1).*C_l.^2./2.*(1/(k.^kk)).*(2.*k.^3./E).^kk.*exp(-2.*k.^3./(3.*E))

%% Tong and Lin
arf = 9;
W_TL = exp(-arf.*(Zc.^2/Ip).*(E./k.^3)).*W_ADK

%% Our work
%kE = E./Eb;
W_M = exp((a1.*kE.^2+a2.*kE+a3)).*W_ADK
