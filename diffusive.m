function [u_diff_num,v_diff_num] = diffusive(u,v)
% Integral of diffusive term, x and y components. L is the domain size.
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   u: Matrix of the horitzontal velocity components
%   v: Matrix of the vertical velocity components
% Outputs:
%   u_diff_num: Solution of the diffusive terms of horitzontal velocity
%   v_diff_num: Solution of the diffusive terms of vertical velocity

N = size(u,1) - 2;

u_diff_num = zeros(N+2,N+2);
v_diff_num = zeros(N+2,N+2);

for i = 2:N+1
    for j = 2:N+1
        % I have deleted the delta because in this case when it is squared 
        % it is canceled and thus we gain calculation time. NS2 Slide 16 
        % shows how it should be, which is the sx(i+1) - sx(i) below and 
        % then multiplied by sy(j) - sy(j-1), but for practical purposes 
        % it's the same distance in our case.

        % NS2 Slide 16

        u_e = u(i+1,j) - u(i,j);
        u_w = u(i,j) - u(i-1,j);
        u_n = u(i,j+1) - u(i,j);
        u_s = u(i,j) - u(i,j-1);
        
        u_diff_num(i,j) = (u_e - u_w + u_n - u_s)*(N^2); % N^2 Appears for 
                                                         % the volume 
                                                         % simplification

        v_e = u(i+1,j) - u(i,j);
        v_w = u(i,j) - u(i-1,j);
        v_n = u(i,j+1) - u(i,j);
        v_s = u(i,j) - u(i,j-1);
        
        v_diff_num(i,j) = (v_e - v_w + v_n - v_s)*(N^2);

    end 
end 


end