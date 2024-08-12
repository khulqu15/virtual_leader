%%
% Azimuth: Sudut horizontal relatif terhadap sumbu X-Y, diukur searah jarum jam dari utara.
% Elevation: Sudut vertikal relatif terhadap sumbu Z, diukur dari bidang X-Y.
% velocity: Kecepatan konstan untuk semua drone.
% acceleration: Akselerasi konstan (dapat dimodifikasi untuk model lebih kompleks).
% omega: Kecepatan sudut untuk gerakan melingkar, dihitung dari radius dan kecepatan linier.
% dmin: Batas jarak antar drone
%%

r = 10;
cx = 0;
cy = 0;
cz = 5;
n_drones = 8;

velocity = 5;
acceleration = 1;
omega = 2 * pi * velocity / r;
d_min = 0.5;
gravity = 9.81;
mass = 1.0;
k = 0.5;
alpha = k * (gravity / mass);

[azimuth_circle, elevation_circle] = bearing_measurement.bearing_circle(n_drones, r, cx, cy, cz);
x_circle = cx + r * cos((2 * pi * (0:n_drones-1)) / n_drones);
y_circle = cy + r * sin((2 * pi * (0:n_drones-1)) / n_drones);
z_circle = cz * ones(1, n_drones);

a = 100;
b = 50;

[azimuth_ellipse, elevation_ellipse] = bearing_measurement.bearing_ellipse(n_drones, a, b, cx, cy, cz);
x_ellipse = cx + a * cos((2 * pi * (0:n_drones-1)) / n_drones);
y_ellipse = cy + b * sin((2 * pi * (0:n_drones-1)) / n_drones);
z_ellipse = cz * ones(1, n_drones);

plotting.formation(x_circle, y_circle, z_circle, r, r, cz, 'Drone Circle Formation');
plotting.formation(x_ellipse, y_ellipse, z_ellipse, a, b, cz, 'Drone Circle Formation');