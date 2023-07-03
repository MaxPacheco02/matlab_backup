% main file
n = 1001;
t_max = 60;
t = linspace(0, t_max,n);
x = 2.5*cos(pi.*t./15);
y = 7*cos(pi.*t./30);
% for i = 1:n
%     if i < n/3
%         y(i) = sin(t(i));
%     elseif i < 2*n/3
%         y(i) = -t(i)*.05+1;
%     else
%         y(i) = cos(t(i))+t(i)*.05-2;
%     end
% end

tf = t(length(t));
ts = tf./(n-1);

parameters

lambda_x = .85;
lambda_y = .85;
lambda = diag([lambda_x, lambda_y]);
k = 1;
omega_bar_x = 10;
omega_bar_sqrt_x = sqrt(omega_bar_x);
omega_bar_y = 10;
omega_bar_sqrt_y = sqrt(omega_bar_y);
omega_bar_sqrt = [omega_bar_sqrt_x; omega_bar_sqrt_y];
sigma_x = 8;
sigma_sqrt_x = sqrt(sigma_x);
sigma_y = 10;
sigma_sqrt_y = sqrt(sigma_y);
sigma_sqrt = [sigma_sqrt_x ; sigma_sqrt_y];

sim('control');

figure
x_model = squeeze(out.simout.Data(1,1,:));
y_model = squeeze(out.simout.Data(2,1,:));
subplot(2,1,1)
plot(x_model, y_model,'b', x,y,'r');
legend('trajectory', 'desired trajectory');
subplot(4,2,5)
plot(t, x_model, 'b', t, x, 'r'), title('x');
legend('x', 'desired x');
subplot(4,2,7)
plot(t, y_model, 'b', t, y, 'r'), title('y');
legend('y', 'desired y');
subplot(4,2,6)
plot(t, x'-x_model), title('x error');
subplot(4,2,8)
plot(t, y'-y_model), title('y error');