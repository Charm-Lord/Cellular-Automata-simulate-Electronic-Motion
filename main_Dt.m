%判断t+1时刻电离的函数
function D = main_Dt(t)
x = main_Et(t);
y = 1./(1+exp(10-x)); %电离概率
n = rand;
if n <= y
    D = 1;
else
    D = 0;
end
end

