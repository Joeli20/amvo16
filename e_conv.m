function [Error_Convectiu, min_error_convectiu] = e_conv(u,v,L,N)
Error_Convectiu = zeros(size(N));

h=L/N;

x=1;
trigger = 0;
min_error_convectiu = 5000;

for i = 2:N+1
    y=1;
    for j = 2:N+1
        Error_Convectiu(x,y)=h/(sqrt(u(i,j)^2+v(i,j)^2));
        trigger = Error_Convectiu(x,y);
        y=y+1;
        if (trigger < min_error_convectiu)
            min_error_convectiu = trigger;
        end
    end
    x=x+1;
end

end