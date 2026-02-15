clc;
clear;
close all;

%% ---------------- INPUT ----------------
v_kmh = input('Enter vehicle speed in km/h: ');
v0 = v_kmh * 1000/3600;     % Convert to m/s

%% ---------------- CONSTANTS ----------------
g = 9.81;
M = 1700;                   % Full vehicle mass
m = M/4;                    % Quarter mass per wheel
R = 0.33;                   % Wheel Radius

I = 0.5 * m * R^2;          % Wheel inertia

mu_peak = 0.9;              % Dry asphalt peak

%% ---------------- THEORETICAL VALUES ----------------
a_theory = mu_peak * g;
t_stop = v0 / a_theory;
s_stop = v0^2 / (2*a_theory);

fprintf('\nInitial Vehicle Speed = %.2f m/s\n', v0);
fprintf('Initial Wheel Speed = %.2f rad/s\n', v0/R);
fprintf('Estimated Stopping Time ≈ %.2f sec\n', t_stop);
fprintf('Estimated Stopping Distance ≈ %.2f meters\n\n', s_stop);

%% ---------------- SIMULATION ----------------
dt = 0.001;
t = 0:dt:t_stop;

v = zeros(size(t));
w = zeros(size(t));

v(1) = v0;
w(1) = v0 / R;

zig_amp = 0.15 * w(1);     % 15% oscillation
zig_freq = 8;              % ABS frequency

for i = 2:length(t)

    % --- Vehicle deceleration ---
    v(i) = v0 * (1 - t(i)/t_stop)^1.2;  % nonlinear smooth
    if v(i) < 0
        v(i) = 0;
    end

    % --- Wheel oscillation ---
    base_w = v(i)/R;

    zig = zig_amp * exp(-3*t(i)) * sin(2*pi*zig_freq*t(i));

    w(i) = base_w + zig;

    if w(i) < 0
        w(i) = 0;
    end
end

%% ---------------- PLOTS ----------------

figure;
plot(t, w, 'LineWidth',2);
title('Wheel Speed (ABS Zig-Zag Behavior)');
xlabel('Time (sec)');
ylabel('Wheel Speed (rad/s)');
grid on;

figure;
plot(t, v, 'LineWidth',2);
title('Vehicle Speed During ABS Braking');
xlabel('Time (sec)');
ylabel('Vehicle Speed (m/s)');
grid on;