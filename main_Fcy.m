%电子相互作用y轴
function Fcy = main_Fcy(y1,y2)
K3 = 25;
yy = abs(y1-y2);
if yy == 0
    F = 0;
else
    F = fix(K3./yy.^2);
end
if y1 >= y2
    Fcy = F;
else
    Fcy = -F;
end
end