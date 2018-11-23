x_lab=0.02:0.02:1;
number_max = 1000;
flag = 0;
rate = zeros(1,50);
r=0.02:0.02:1;

for m = 1 : 1 :4
    switch m
        case 1
            n = 10;
        case 2
            n = 20;
        case 3
            n = 50;
        case 4
            n = 100;
    end
    for k=1:1:50
        for number=1:1:number_max
            flag_overflow=1;
            x=rand(n,1);
            y=rand(n,1);
            p = zeros(n,n);
            for num=1:1:n
                for sec_num=1:1:n
                    if(sqrt((x(num)-x(sec_num))^2+(y(num)-y(sec_num))^2)<r(k))
                        p(num,sec_num)=1;
                    else
                        p(num,sec_num)=0;
                    end
                end
            end
            t=p;
            for s=1:1:n-1
                t=t*p;
            end
            for i=1:1:n
                for j=1:1:n
                    if t(i,j)<=0
                        flag_overflow=0;
                        break;
                    end
                end
                if flag_overflow==0
                    break;
                end
            end
            rate(k)=rate(k)+flag_overflow;
        end
        rate(k)=rate(k)/number_max;
    end
    flag = flag + 1;
    switch flag
        case 1
            plot(x_lab,rate,'o-g');
        case 2
            plot(x_lab,rate,'*-b');
        case 3
            plot(x_lab,rate,'d-y');
        case 4
            plot(x_lab,rate,'s-r');
    end
    axis([0 1 0 1]);
    hold on
end
title('连通率-通信范围r的关系图');
legend('n = 10','n = 20','n = 50','n = 100');
xlabel('通信范围');
ylabel('连通率');