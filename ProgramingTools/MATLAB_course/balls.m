function balls(d,b,h)
% Function to calculate the number of balls with diameter d that fit in a
% cylindrical container with base b and height h.
Vc = h*pi*(b/2)^2;
Vd = d^3;

balls = floor(Vc/Vd)