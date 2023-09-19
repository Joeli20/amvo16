function [o1,o2] = trial(A,l)
% This is just an example function

% Input:
%   A is a matrix that must be square and at least 5x5;
%   l is a velocity (m/s)
% Output:
%   o1 is A(2,2)*A(5,5)
%   o2 is l^2 (m^2/s^2)

s = size(A); % s is a vector where s(1) indicates the number of rows and 
             % s(2) the number of columns

if s(1)~=s(2)
    error('The matrix must be square')
end
if s(1)<5
    error('The matrix must be at least 5x5')
end

o1 = A(2,2)*A(5,5);
o2 = l^2; %m^2/s^2
end