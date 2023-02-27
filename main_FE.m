%场强作用势
function FE = main_FE(t)
K1 = 1;
FE = K1.*fix(main_Et(t));
end