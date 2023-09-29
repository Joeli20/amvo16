function d = diverg(u,v,L)
% diverg gives the integral of the divergence

% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.

% Inputs:
    % u: Matrix of the horitzontal components
    % v: Matrix of the vertical components
    % L: length of a side of the analysed square
% Outputs:
    % d: Matrix of the divergence of u and v

N = size(u,1)-2;
h = L/N;
d = zeros(N+2,N+2);

for i = 2:N+1
    for j = 2:N+1
        d(i,j) = (u(i,j)-u(i-1,j)+v(i,j)-v(i,j-1))*h; % int(div(u,v))dh // div(u,v)=du/di+dv/dj
    end
end

end