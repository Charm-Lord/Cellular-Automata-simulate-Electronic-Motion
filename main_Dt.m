%�ж�t+1ʱ�̵���ĺ���
function D = main_Dt(t)
x = main_Et(t);
y = 1./(1+exp(10-x)); %�������
n = rand;
if n <= y
    D = 1;
else
    D = 0;
end
end

