function [u_conv,v_conv] = diffusive(u,v,L)
% Integral of diffusive term, x and y components. L is the domain size.

% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.

% Inputs:
    % u: Matrix of the horitzontal velocity components
    % v: Matrix of the vertical velocity components
    % L: length of a side of the analysed square
% Outputs:
    % u_conv: Solution of the diffusive terms of horitzontal velocity
    % v_conv: Solution of the diffusive terms of vertical velocity


cu = u + v + L;

end