function [u_diff,v_diff] = diffusive(u,v,L)
% Integral of diffusive term, x and y components. L is the domain size.

% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.

% Inputs:
    % u: Matrix of the horitzontal velocity components
    % v: Matrix of the vertical velocity components
    % L: length of a side of the analysed square
% Outputs:
    % u_diff: Solution of the diffusive terms of horitzontal velocity
    % v_diff: Solution of the diffusive terms of vertical velocity

N = size(u,1) - 2;

u_diff = zeros(N+2,N+2);
v_diff = zeros(N+2,N+2);

for i = 2:N+1
    for j = 2:N+1
        % m'he petat el delta xq en aquest cas al ser quadrat s'anula i
        % així guanyem temps de càlcul. a la diapo 16 es veu com hauria de
        % ser, que és el sx(i+1) - sx(i) a sota i després multiplicat pel
        % sy(j) - sy(j-1), però a efectes pràctics és la mateixa distància

        du_e = u(i+1,j) - u(i,j); % diapo 16
        du_w = u(i,j) - u(i-1,j);
        du_n = u(i,j+1) - u(i,j);
        du_s = u(i,j) - u(i,j-1);
        
        dv_e = v(i+1,j) - v(i,j); % diapo 16
        dv_w = v(i,j) - v(i-1,j);
        dv_n = v(i,j+1) - v(i,j);
        dv_s = v(i,j) - v(i,j-1);

        u_diff(i,j) = du_e - du_w + du_n - du_s ; % diapo 16
        v_diff(i,j) = dv_e - dv_w + dv_n - dv_s ;
    end 
end 


end