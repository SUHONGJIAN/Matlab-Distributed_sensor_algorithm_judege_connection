r = 0.4;
n = 50;

x = rand(n,1);
y = rand(n,1);
for num=1:1:n
    for sec_num=1:1:n
        if(sqrt((x(num)-x(sec_num))^2+(y(num)-y(sec_num))^2)<r) && num ~= sec_num
            plot([x(num),x(sec_num)],[y(num),y(sec_num)],'-sk');
            hold on
        end
    end
end
title('��ͨ��������ͼ');
xlabel('�ڵ�x����');
ylabel('�ڵ�y����');
text(0.88,0.95,'R = 0.4');