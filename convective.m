function [u_conv,v_conv] = convective(u,v,L)
% Integral of convective term, x and y components. L is the domain size.

% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.

% Inputs:
    % u: Matrix of the horitzontal velocity components
    % v: Matrix of the vertical velocity components
    % L: length of a side of the analysed square
% Outputs:
    % u_conv: Solution of the convective terms of horitzontal velocity
    % v_conv: Solution of the convective terms of vertical velocity

N = size(u,1) - 2;

u_conv = zeros(N+2,N+2);
v_conv = zeros(N+2,N+2);

delta = L/N;

for i = 2:N+1
    for j = 2:N+1
        
        u_e = (u(i+1,j) + u(i,j))/2; % Diapo 12
        u_w = (u(i-1,j) + u(i,j))/2;
        u_n = (u(i,j+1) + u(i,j))/2;
        u_s = (u(i,j-1) + u(i,j))/2;
        v_e = (v(i+1,j) + v(i,j))/2;
        v_w = (v(i-1,j) + v(i,j))/2;
        v_n = (v(i,j+1) + v(i,j))/2;
        v_s = (v(i,j-1) + v(i,j))/2;

        % A diferència del diffusive, aquí no ens podem petar els delta xq
        % hi ha sumes pel mig, però si que ho agrupem i fem factor comú
        % així estalviem capacitat de càlcul.

        Fu_e = (u(i+1,j) + u(i,j))*delta/2; % Diapo 13
        Fu_w = (u(i-1,j) + u(i,j))*delta/2;
        Fu_n = (v(i+1,j) + v(i,j))*delta/2;
        Fu_s = (v(i+1,j-1) + v(i,j-1))*delta/2;

        Fv_e = (u(i,j+1) + u(i,j))*delta/2; % Diapo 13
        Fv_w = (u(i-1,j) + u(i-1,j+1))*delta/2;
        Fv_n = (v(i,j+1) + v(i,j))*delta/2;
        Fv_s = (v(i,j-1) + v(i,j))*delta/2;

        u_conv(i,j) = u_e*Fu_e - u_w*Fu_w + u_n*Fu_n - u_s*Fu_s; %Diapo 11
        v_conv(i,j) = v_e*Fv_e - v_w*Fv_w + v_n*Fv_n - v_s*Fv_s ;
    end
end

end