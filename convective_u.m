function [cu] = convective_u(u,v,L)
% Integral of convective term, x components. L is the domain size.

cu = u + v + L;

end