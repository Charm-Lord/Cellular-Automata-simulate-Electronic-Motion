
%元胞自动机模拟电子运动
clear all
clc
Map = [1 1 1; 0 0 0];
colormap(Map);
% 设置电子数目及网格大小
S = 200;
tm = 1000;
L = zeros(S);
E = zeros(S,tm);
main_EE = 0;    %偏置电压
for i = 1:S
    x(i,1) = i;
    y(i,1) = 1;
    vx(i,1) = 0;
    vy(i,1) = 0;
    ax(i,1) = 0;
    ay(i,1) = 0;
    D(i,1) = 0;
end
for i = 1:S
    L(y(i,1),x(i,1)) = 1;
end
imagesc(L);
Ek = zeros(tm,1);
h = waitbar(0,'数据输出中')
for t = 1:tm
    L = zeros(S);
    for i = 1:S
        if D(i,t) == 0 
            D(i,t+1) = main_Dt(t+1);
            if D(i,t+1) == 0
                x(i,t+1) = x(i,t);
                y(i,t+1) = 1;
                vx(i,t+1) = 0;
                vy(i,t+1) = 0;
                ax(i,t+1) = 0;
                ay(i,t+1) = 0;
            else
                x(i,t+1) = x(i,t);
                y(i,t+1) = 1;
                vx(i,t+1) = 0;
                vy(i,t+1) = main_Vt;
                ax(i,t+1) = 0;
                ay(i,t+1) = main_FE(t)+main_EE;
            end
        else
            x(i,t+1) = x(i,t)+vx(i,t);
            y(i,t+1) = y(i,t)+vy(i,t);
            vx(i,t+1) = vx(i,t)+ax(i,t);
            vy(i,t+1) = vy(i,t)+ay(i,t);
            
            %计算电子之间相互作用
            r0 = 5; %规定作用范围
            for j = 1:S
                xx = x(i,t)-x(j,t);
                yy = y(i,t)-y(j,t);
                if abs(xx) <= r0 && abs(yy) <= r0
                    Fcx = main_Fcx(x(i,t),x(j,t));
                    Fcy = main_Fcy(y(i,t),y(j,t));
                else
                    Fcx = 0;
                    Fcy = 0;
                end
            end
            ax(i,t+1) = Fcx;
            yy = y(i,t);
            if yy >= 6  %原子实最大作用范围
                ay(i,t+1) = main_FE(t)+main_EE+Fcy;
            else
                ay(i,t+1) = main_FE(t)+main_Fk(yy)+main_EE+Fcy;
            end
            if x(i,t+1) < 1
                x(i,t+1) = 1;
            end
            if y(i,t+1) <= 1
                D(i,t+1) = 0;
                y(i,t+1) = 1;
            else
                D(i,t+1) = 1;
            end
        end
        Lx = int32(x(i,t));
        Ly = int32(y(i,t));
        L(Ly,Lx) = 1;
        E(i,t) = 0.5.*(vx(i,t).^2+vy(i,t).^2);
        Ek(t) = Ek(t)+E(i,t);
    end
     imagesc(L);
     set(gca,'YDir','normal')
     xlabel('x')
     ylabel('y')
    p = fix(t/tm*10000)/100; 
    str=['目前进度为 ',num2str(p),' %，完成 ',num2str(t),'/',num2str(tm)];
    waitbar(t/tm,h,str); 
    pause(0.0001);
end
tt = 1:tm;
Ek = Ek./S;
result = Ek(tm,1)
figure(1)
plot(tt,Ek)
xlabel('相对时间')
ylabel('电子平均总动能')
figure(2)
h = histogram(E(:,tm))
xlabel('电子动能')
ylabel('计数')
