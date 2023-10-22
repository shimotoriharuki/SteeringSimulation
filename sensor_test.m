syms theta

theta_l = 10;
% axis_offset = 0; %頂点のオフセット
max = 1000;

%0°のとき，maxの半分になる特性
% eq_l = - (max / (2 * (theta_l^2))) * (theta - theta_l)^2 + max;
% eq_r = - (max / (2 * (theta_l^2))) * (theta + theta_l)^2 + max;

%-theta_lが0, theta_lがMAX, 3hteta_lが0の特性
eq_l = - (max / (4 * (theta_l^2))) * (theta - theta_l)^2 + max; % 左
eq_r = - (max / (4 * (theta_l^2))) * (theta + theta_l)^2 + max; % 右

%0以下のときは0になるように細工
eq_l = piecewise(eq_l < 0, 0, eq_l >= 0, eq_l);
eq_r = piecewise(eq_r < 0, 0, eq_r >= 0, eq_r);

figure(1)
fplot(eq_l, [-30, 30])
hold on
fplot(eq_r, [-30, 30])
hold off
ylim([0, max])
legend("左センサー", "右センサー")

figure(2)
eq_diff = eq_l - eq_r; % 差を取ると結局線形になる
fplot(eq_diff, [-30, 30])
legend("左右のセンサの差")
