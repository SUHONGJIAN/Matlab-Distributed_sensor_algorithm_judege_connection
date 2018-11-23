x_lab=5:5:100;
number_max = 1000;
flag = 0;
rate = zeros(1,20);
x_y = [];

for r = 0.05 : 0.1 :0.45
    for k=5:5:100
        p = zeros(k,k);
        for number=1:1:number_max
            flag_overflow=1;
            x_y =rand(k,2,1);
            for num=1:1:k
                for sec_num=1:1:k
                    if(sqrt((x_y(num,1)-x_y(sec_num,1))^2+(x_y(num,2)-x_y(sec_num,2))^2)<r)
                        p(num,sec_num)=1;
                    else
                        p(num,sec_num)=0;
                    end
                end
            end
            t=p;
            p;
            for s=1:1:k-1
                t=t*p;
            end
            for i=1:1:k
                for j=1:1:k
                    if t(i,j)<=0
                        flag_overflow=0;
                        break;
                    end
                end
                if flag_overflow==0
                    break;
                end
            end
            rate(k/5)=rate(k/5)+flag_overflow;
        end
        rate(k/5)=rate(k/5)/number_max;
    end
    flag = flag + 1;
    rate(1) = 0;
    switch flag
        case 1
            plot(x_lab,rate,'+-c');
        case 2
            plot(x_lab,rate,'o-g');
        case 3
            plot(x_lab,rate,'*-b');
        case 4
            plot(x_lab,rate,'d-y');
        case 5
            plot(x_lab,rate,'s-r');
    end
    axis([0 100 0 1]);
    hold on
end
title('连通率-节点数n的关系图');
legend('r = 0.05','r = 0.15','r = 0.25','r = 0.35','r = 0.45');
xlabel('节点数');
ylabel('连通率');