# Laboratorio 1: Monitoreo del patrón y Frecuencia Respiratoria

## Integrantes
* Laura Valentina Velásquez Castiblanco (5600846)
* Carlos Felipe Moreno Guzmán (5600881)
* Juan Andrés Mateus Durán (5600787)

## Objetivos

### Objetivo General
Analizar cómo el hecho de hablar o verbalizar afecta el ritmo y comportamiento de la respiración de una persona.

### Objetivos Específicos
- Identificar las principales variables físicas que intervienen en el proceso de la respiración.
- Diseñar un sistema capaz de captar el patrón respiratorio y calcular la frecuencia respiratoria.
- Detectar tareas de habla o verbalización a partir del análisis del patrón respiratorio y/o su frecuencia.

> ### Parte A
### **1. Revisión de la literatura**
La respiración es el proceso fisiológico mediante el cual un organismo intercambia oxígeno (O₂) y dióxido de carbono (CO₂) con el medio ambiente. A nivel pulmonar, este intercambio ocurre en los alvéolos pulmonares a través de la membrana alveolocapilar, donde el O₂ inhalado difunde hacia el torrente sanguíneo y el CO₂ producido por el metabolismo celular difunde en sentido contrario para ser exhalado. El ciclo respiratorio completo comprende dos fases mecánicas: la inspiración, generada por la contracción del diafragma y los músculos intercostales externos (que expande la cavidad torácica y reduce la presión intrapulmonar por debajo de la atmosférica, permitiendo el ingreso de aire), y la espiración, que en condiciones de reposo es un proceso pasivo producido por el retroceso elástico del tejido pulmonar y de la caja torácica [1]

#### Variables físicas involucradas en el proceso respiratorio
Desde el punto de vista de la instrumentación biomédica, el proceso respiratorio puede caracterizarse mediante diferentes cambios físicos que reflejan la mecánica de la respiración. Las principales variables físicas involucradas en este proceso son:



> ### Parte B
En la presente sección, se aborda la etapa de adquisición temporizada en MATLAB y caracterización espectral de la señal respiratoria por medio del sistema desarrollado en la Parte A. Empleando el entorno de MATLAB, se registraron dos señales de 30 segundos en dos escenarios fisiológicos contrastantes; estado de **reposo** y durante **habla/lectura**. A partir de estas señales, se evalúa la necesidad de filtrado digital y se aplica la *Transformada Rápida de Fourier (FFT)* con el fin de identificar las frecuencias dominantes asociadas al patrón de respiración humana en cada condición. 

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
La propiedad `.Time` contiene las marcas de tiempo absolutas asignadas durante la adquisición. Para iniciar en $t=0s$, se resta el tiempo registrado en la primera posición `Time(1)`. Finalmente, `seconds()` convierte la diferencia en un vector de valores numéricos expresados en segundos. La señal se encuentra almacenada en la propiedad `.Variables`, por lo que se extrae y se asigna a un vector diferente.

Una vez extraídos y normalizados los vectores de tiempo y amplitud, se procede a garantizar la persistencia de los datos sin depender de la sesión activa de MATLAB.

```matlab
%% Guardar señales (REPOSO y HABLA)

save('reposo.mat', 'senal_reposo', 't_reposo');
save('habla.mat', 'senal_habla', 't_habla');
```

Los vectores procesados se almacenan de forma limpia e independiente en los archivos binarios de tipo `.mat`, empleando el comando `save`.

> [!TIP]
> Al especificar explícitamente los nombres de las variables como argumentos entre comillas (por ejemplo `'senal_reposo'`, `'t_reposo'`), se evita almacenar todo el contenido innecesario del Workspace (como los objetos pesados `timetable` originales).

Para ejecutar las siguientes estructuras de análisis sin necesidad de importar todo el Workspace, basta con tener los archivos `reposo.mat` y `habla.mat` en la misma carpeta de trabajo y cargarlos al entorno ejecutando la siguiente sección:

```matlab
% Cargar señales (REPOSO y HABLA)

load('reposo.mat');
load('habla.mat');
```

### **3. Evaluación de Calidad de Señal - Decisión de Filtrado**

Tras inspeccionar visualmente los registros en el dominio del tiempo, se determinó que **no fue necesaria la aplicación de una etapa de filtrado digital** a ninguna de las dos señales. Esta decisión se fundamenta teniendo en cuenta diversos criterios que se discuten a continuación:

* **Correcto acoplamiento físico del sensor:** El uso de la máscara de nebulización para adaptar el sensor MQ-135 garantizó un sellado efectivo alrededor de las vías aéreas que permitió encauzar y detectar de manera óptima los cambios en la concentración de los gases producto de la respiración, reduciendo pérdida de flujo y a su vez la aparición de artefactos indeseados.

* **Morfología clara y bajo nivel de ruido:** La señal en reposo exhibe ciclos respiratorios cuasi-periódicos claramente definidos con oscilaciones limpias, sin presencia apreciable de ruido de alta frecuencia (como interferencia de la red eléctrica o ruido térmico).

* **Preservación de componentes fisiológicas:** En la condición de habla, las variaciones más rápidas e irregulares observadas corresponden a la modulación real de la respiración durante la fonación. Aplicar un filtro pasa-bajas habría eliminado o distorsionado estos cambios dinámicos propios del proceso del habla.

Por ende, la calidad directa de la adquisición permitió proceder con el análisis espectral sin requerir etapas de filtrado digital.

### **4. Análisis en Frecuencia - Espectro Dominante**

> ### Parte C

