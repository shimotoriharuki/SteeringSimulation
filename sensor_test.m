syms theta

theta_l = 5;
max = 1000;

% eq = -(4 * max / theta_l^2)*theta * (theta - theta_l);
eq_l = - (max / (2 * (theta_l^2))) * (theta - theta_l)^2 + max;
eq_r = - (max / (2 * (theta_l^2))) * (theta + theta_l)^2 + max;

fplot(eq_l, [-2*theta_l, 2*theta_l])
hold on
fplot(eq_r, [-2*theta_l, 2*theta_l])
hold off
ylim([0, max])