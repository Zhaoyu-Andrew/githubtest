% define original function
fxy = @(x, y) (x-2).^2 + (y+1).^2+5*sin(x)*sin(y)+100;
f = @(p) fxy(p(1), p(2));

% function for gradient
f_x = @(x, y) 2*(x-2) + 5*cos(x)*sin(y);
f_y = @(x, y) 2*(y+1) + 5*sin(x)*cos(y);
fgrad = @(p) [f_x(p(1),p(1)); f_y(p(1),p(2))];

p0 = [6; 4];  % choose an initial guess
grad = fgrad(p0);  % Find which direction to go
phi = @(t)p0 - t*grad; % Define the "path"
f_of_phi = @(t) f(phi(t)); % create a function of "height along path"
tmin = fminbnd(f_of_phi, 0, 1); % find the time it takes to reach min height
p1 = phi(tmin); % Find the point on the path and update your guess 



