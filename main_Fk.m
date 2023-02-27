%原子实作用势
function Fk = main_Fk(yy)
K2 = 25;
Fk = -fix(K2./yy.^2);
end