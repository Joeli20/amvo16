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


cu = u + v + L;

end