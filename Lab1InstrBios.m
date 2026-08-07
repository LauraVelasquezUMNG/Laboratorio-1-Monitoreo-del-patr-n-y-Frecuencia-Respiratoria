
clc; clear all; close all;

%% ------ Parte A -------

fs = 1000;   % Frecuencia de muestreo (Hz)

% Cargar señales (REPOSO y HABLA)
load('reposo.mat');
load('habla.mat');

% Invertir señal habla
senal_habla = senal_habla*-1;

%% Graficar señal REPOSO

figure;
plot(t_reposo, senal_reposo);
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Señal en Reposo');
grid on;

%% Graficar Señal HABLA

figure;
plot(t_habla, senal_habla, 'r');
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Señal en Habla');
grid on;

%% ------- PARTE B -------

% REPOSO
% Extraer señal como vector
t_reposo = seconds(reposo1.Time - reposo1.Time(1));  % Tiempo en segundos desde t = 0
senal_reposo = reposo1.Variables;

% HABLA
% Extraer tiempo y señal
t_habla = seconds(habla1.Time - habla1.Time(1));   % Tiempo en segundos desde t = 0
senal_habla = habla1.Variables;

%% Guardar señales (REPOSO y HABLA)

save('reposo.mat', 'senal_reposo', 't_reposo');
save('habla.mat', 'senal_habla', 't_habla');

%% == Análisis en Frecuencia ==

% REPOSO

% Eliminar componente DC
senal_reposo = senal_reposo - mean(senal_reposo);

% FFT
N_rep = length(senal_reposo);
Y_rep = fft(senal_reposo);

% Espectro de potencia
P_rep = abs(Y_rep).^2/N_rep;

% Frecuencia
f_rep = (0:N_rep-1)*(fs/N_rep);

% Mitad positiva del espectro
P_rep = P_rep(1:floor(N_rep/2));
f_rep = f_rep(1:floor(N_rep/2));

%% Espectro Frecuencia - REPOSO

figure;
plot(f_rep, P_rep, 'LineWidth', 1.5);
xlim([0 5]);
grid on;
xlabel('Frecuencia (Hz)');
ylabel('Potencia');
title('Espectro de potencia - Reposo');

%% HABLA
% Eliminar componente DC
senal_habla = senal_habla - mean(senal_habla);

% FFT
N_hab = length(senal_habla);
Y_hab = fft(senal_habla);

% Espectro de potencia
P_hab = abs(Y_hab).^2/N_hab;

% Frecuencia
f_hab = (0:N_hab-1)*(fs/N_hab);

% Mitad positiva
P_hab = P_hab(1:floor(N_hab/2));
f_hab = f_hab(1:floor(N_hab/2));

%% Espectro de Frecuencia - HABLA

figure;
plot(f_hab, P_hab, 'r', 'LineWidth', 1.5);
xlim([0 5]);
grid on;
xlabel('Frecuencia (Hz)');
ylabel('Potencia');
title('Espectro de potencia - Habla');

%% Frecuencias Dominantes

[~,idx_rep] = max(P_rep(2:end));
idx_rep = idx_rep + 1;

[~,idx_hab] = max(P_hab(2:end));
idx_hab = idx_hab + 1;

disp('----- FRECUENCIAS DOMINANTES -----')
fprintf('Reposo: %.3f Hz\n',f_rep(idx_rep));
fprintf('Habla: %.3f Hz\n',f_hab(idx_hab));

%% Frecuencias Respiratorias

disp('----- FRECUENCIAS RESPIRATORIAS -----');
fprintf('Reposo: %.2f respiraciones/min\n',60*f_rep(idx_rep));
fprintf('Habla: %.2f respiraciones/min\n',60*f_hab(idx_hab));
