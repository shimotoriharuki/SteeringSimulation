syms theta

theta_l = 5;
max = 1000;

eq_l = - (max / (2 * (theta_l^2))) * (theta - theta_l)^2 + max;
eq_r = - (max / (2 * (theta_l^2))) * (theta + theta_l)^2 + max;

figure(1)
fplot(eq_l, [-2*theta_l, 2*theta_l])
hold on
fplot(eq_r, [-2*theta_l, 2*theta_l])
hold off
ylim([0, max])

figure(2)
eq_diff = eq_r - eq_l; % 差を取ると結局線形になる
fplot(eq_diff)
