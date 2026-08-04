# Laboratorio 1: Monitoreo del patrón y Frecuencia Respiratoria

## Integrantes
* Laura Valentina Velásquez Castiblanco (5600846)
* Carlos Felipe Moreno Guzmán (5600881)
* Juan Andrés Mateus Durán (5600787)

## Objetivos:
* Identificar las principales variables físicas que intervienen en el proceso de la respiración.
* Diseñar un sistema capaz de captar el patrón respiratorio y calcular la frecuencia respiratoria.
* Detectar tareas de habla o verbalización a partir del análisis del patrón respiratorio y/o su frecuencia.

> ### Parte A

> ### Parte B
En la presente sección, se aborda la etapa de adquisición temporizada en MATLAB y caracterización espectral de la señal respiratoria por medio del sistema desarrollado en la Parte A. Empleando el entorno de MATLAB, se registraron dos señales de 30 segundos en dos escenarios fisiológicos contrastantes; estado de reposo y durante habla/lectura. A partir de estas señales, se evalúa la necesidad de filtrado digital y se aplica la *Transformada Rápida de Fourier (FFT)* con el fin de identificar las frecuencias dominantes asociadas al patrón de respiración humana en cada condición. 

### **1. Adquisición temporizada de la señal**
Para adquirir las señal respiratoria de carácter análogo proveniente de la configuración desarrollada en la Parte A, se utilizó el aplicativo ***Analog Imput Recorder*** perteneciente a *Data Acquisition Toolbox* integrado en MATLAB. Esta aplicación permite adquirir y visualizar señales provenientes de dispositivos de adquisición compatibles con MATLAB. En este caso, se utilizó un módulo *NI-DAQmx*, el cual realizó la conversión ADC hacia la computadora.

Posteriormente, en la interfaz de ***Analog Imput Recorder***, se configuró el tiempo de adquisición de las señales $T_s$ y la frecuencia de muestreo $f_s$ como se muestra a continuación:

$$T_s=30s$$
$$f_s=1 kHz$$

Así, el número total de muestras capturadas fue $n=T_sf_s$:

$$n=30.000$$

### **2. Extracción y Almacenamiento en MATLAB**
Tras la captura de las señales, los registros se exportan al *workspace* como objetos de tipo `timetable` (en particular, se asignaron las variables `reposo1` y `habla1` para cada señal respectivamente). A partir de estas estructuras, se procesan los datos mediante un script en MATLAB para independizar los vectores de tiempo y amplitud:

```matlab
% REPOSO
% Extraer señal como vector
t_reposo = seconds(reposo1.Time - reposo1.Time(1));  % Tiempo en segundos desde t = 0
senal_reposo = reposo1.Variables;

% HABLA
% Extraer tiempo y señal
t_habla = seconds(habla1.Time - habla1.Time(1));   % Tiempo en segundos desde t = 0
senal_habla = habla1.Variables;
```



> ### Parte C

