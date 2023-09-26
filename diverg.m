function d = diverg(u,v)
% diverg gives the integral of the divergence

% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.

% Inputs:
    % u,v: vector field (staggered) 
% Outputs:
    % d: scalar field



d = int(divergence(u,v,x,y));

end