%计算电离概率
clear all
clc

Zc = 1;
Ip = 11.26/27.212;   % C的电离能eV
L = 1;               % C的轨道角量子数，p态 l=1
C_l = 2.52;          % 隧穿区电子波函数的振幅

global E0

k = sqrt(2.*Ip);
Eb = k.^4./(16.*Zc);
nmax = 100;
kE = linspace(0.01,0.1,nmax);
P1 = []; P2 = []; P3 = [];
for i = 1:nmax
    kk = kE(i);
    E0 = Eb.*kk;
    P1(i) = quadl('pp(1,0.412,1,2.52,t)',-35,35);%0,13.35);
    %P2(i) = quadl('ppTL(1,0.579,1,2.44,t)',-35,35);%0,13.35);
    %P3(i) = quadl('ppM(1,0.579,1,2.44,t)',-35,35);%0,13.35);
end
P1 = 1-exp(-P1);
%P2 = 1-exp(-P2);
%P3 = 1-exp(-P3);

plot(kE,P1)
xlabel('F/Fb')
ylabel('Pro')
% plot(kE,P1,'-k',kE,P2,'-b')
% hold on 
% plot(kE,P3,'-r')
% legend('ADK','Tong-Lin','Ourwork')
% xlabel('F/Fb')
% ylabel('Pro')

    



