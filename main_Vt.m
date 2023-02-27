%随机初射速度
function v = main_Vt
K4 = 20;
b = 5;
v = normrnd(K4,b); %以正态分布简化
v = fix(v);
end