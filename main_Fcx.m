%电子相互作用x轴
function Fcx = main_Fcx(x1,x2)
K3 = 25;
xx = abs(x1-x2);
if xx == 0
    F = 0;
else
    F = fix(K3./xx.^2);
end
if x1 >= x2
    Fcx = F;
else
    Fcx = -F;
end
end