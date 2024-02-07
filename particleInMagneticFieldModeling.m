I = 10.0;
v_x = 2.0;
v_y = 3.0;
v_z = 0;


x = 0;
y = 4;
z = 0.4;

h = 10^(-3);
B_x = 0;
B_y = 0;
B_z = 0;
e = -1.6 * 10^(-19);
m = 1.67 * 10^(-27);
mu_0 = 4 * pi * 10^(-7);


X = zeros(1000, 1);
Y = zeros(1000, 1);
Z = zeros(1000, 1);

for i=1:1000
    B_y = (-mu_0 * I * z)/(2 * pi * (y^2 + z^2));
    B_z = (mu_0 * I * y)/(2 * pi * (y^2 + z^2));
    v_x = v_x - (e / m) * (v_y * B_z - v_z * B_y) * h;
    v_y = v_y + (e / m) * (v_x * B_z) * h;
    v_z = v_z - (e / m) * (v_x * B_y) * h;
    x = x + v_x * h;
    y = y + v_y * h;
    z = z + v_z * h;
    X(i) = x;
    Y(i) = y;
    Z(i) = z;
end

plot(X, Z)
%plot3(X, Y, Z);
grid on
title('Траектория движения заряженной частицы в поле прямого тока')
xlabel('x')
ylabel('y')
%zlabel('z')
