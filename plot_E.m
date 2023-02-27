%�糡����ͼ��
clear all
clc

E0 = 1;     % ��λ W/cm2
T = 2.76;   % ��λ fs
n = 5;

Zc = 1;
Ip = 0.579;     % Ar�ĵ�����eV
l = 1;          % Ar�Ĺ������������p̬ l=1
C_l = 2.44;     % �������Ӳ����������
k = sqrt(2.*Ip);
Eb = k.^4./(16.*Zc);
kk = 2.*Zc./k-1;

tao = n*T;
fai1 = pi;
w = 2*pi/T;

t = -35:.01:35;
%E = E0.*sin(pi.*t./tao).^2.*cos(w.*t+fai1);
E = -E0.*cos(w.*t+pi).*exp(-2.*log(2).*t.^2./tao.^2);
subplot(1,2,1)
plot(t,E)
%E = E0.*cos(w.*t);
E = abs(E);
%W = 4./E.*exp(-2./(3.*E));
W = (2.*l+1).*C_l.^2./2.*(1/(k.^kk)).*(2.*k.^3./E).^kk.*exp(-2.*k.^3./(3.*E));
subplot(1,2,2)
plot(t,W)
%plot(t,log10(W))