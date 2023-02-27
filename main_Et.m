%电场大小随时间变化函数
function E = main_Et(t)
%global E0
E0 = 20;
t = t-500;         
T = 50;        
n = 5;
tao = n*T;
fai1 = pi;
w = 2*pi/T;
E = -E0.*cos(w.*t+pi).*exp(-2.*log(2).*t.^2./tao.^2);
end