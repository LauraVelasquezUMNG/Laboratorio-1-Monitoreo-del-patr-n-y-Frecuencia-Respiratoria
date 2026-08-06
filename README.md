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

* **Flujo de aire respiratorio:** Corresponde al volumen de aire que entra y sale de los pulmones por unidad de tiempo. Su medición permite determinar parámetros como el volumen corriente, la frecuencia respiratoria y el patrón ventilatorio. Esta variable puede ser medida mediante sensores de flujo o variaciones térmicas (termistores) en la corriente de aire.

* **Movimiento torácico y abdominal:** Durante la inspiración, la contracción del diafragma y de los músculos intercostales hacen incrementar el volumen de la cavidad torácica, produciendo la expansión del tórax y, en menor medida, del abdomen. Durante la espiración ocurre el proceso contrario. Esta es una de las variables más utilizadas para el monitoreo no invasivo de la respiración, ya que puede medirse mediante bandas elásticas con sensores piezoeléctricos, sensores piezorresistivos, sensores de deformación, sensores capacitivos o sensores flexibles.

* **Presión respiratoria:** Durante el ciclo respiratorio se producen cambios de presión entre el interior de los pulmones y la atmósfera. Estas diferencias de presión permiten el desplazamiento del aire y pueden registrarse mediante sensores de presión absoluta o diferencial, especialmente en sistemas de ventilación mecánica o estudios de función pulmonar.

* **Temperatura del aire respirado:** El aire exhalado posee una temperatura cercana a la corporal, mientras que el aire inspirado normalmente se encuentra a temperatura ambiente. Esta diferencia puede utilizarse para detectar cada ciclo respiratorio mediante termistores o sensores digitales de temperatura ubicados cerca de la nariz o la boca.

* **Concentración de dióxido de carbono (CO₂):** Corresponden las diferencias en concentración de CO₂ presentes en el ciclo respiratorio. El aire exhalado contiene una concentración de CO₂ considerablemente mayor que el aire inspirado. Esta variable se mide mediante capnografía y proporciona información sobre la ventilación alveolar.

* **Humedad del aire exhalado:** Durante la espiración aumenta la humedad relativa del aire debido al paso por las vías respiratorias. Los sensores de humedad permiten identificar el patrón respiratorio de manera no invasiva, aunque son más sensibles a las condiciones ambientales.

Cada una de estas variables constituye en principio, una vía distinta para transducir la señal respiratoria a una magnitud eléctrica.

#### Ancho de banda de las señales respiratorias



### **2. Selección del sensor y construcción del sistema de adquisición**



### **3. Visualización de la señal respiratoria en reposo y durante el habla**

Una vez adquirida la señal respiratoria mediante el sistema descrito, se procedió a visualizar su comportamiento en el dominio del tiempo. En la Fig. 1 se presenta la señal correspondiente a la condición de reposo, donde el eje horizontal representa el tiempo transcurrido en segundos, durante la ventana de captura de 30 s establecida en la guía, mientras que el eje vertical corresponde al voltaje en voltios, de la señal respiratoria adquirida. De manera análoga, en la Fig. 2 se muestra la señal obtenida bajo la condición de habla, conservando los mismos ejes: tiempo en segundos en el eje horizontal y voltaje en voltios en el eje vertical.

Fig.1
<img width="1402" height="912" alt="reposo" src="https://github.com/user-attachments/assets/a94e9512-2c3f-4cfe-9679-b4ad3d4fc18c" />

Fig.2
<img width="1402" height="912" alt="habla" src="https://github.com/user-attachments/assets/2607433a-35aa-498e-a462-6145de5659c9" />

Con el fin de identificar el contenido espectral de la señal respiratoria, se aplicó la Transformada de Fourier a cada una de las señales adquiridas, obteniendo así su representación en el dominio de la frecuencia. En la Fig. 3 se presenta la representación en frecuencia correspondiente a la condición de reposo, donde el eje horizontal indica la frecuencia en Hz, mientras que el eje vertical corresponde a la potencia de la señal, graficada en escala semilogarítmica para facilitar la visualización del amplio rango dinámico presente en el espectro. De forma equivalente, en la Fig. 4 se muestra la representación en frecuencia obtenida para la condición de habla, manteniendo los mismos ejes descritos anteriormente.

Fig.3

<img width="964" height="637" alt="freposo" src="https://github.com/user-attachments/assets/afde5168-9ed6-42f5-b8ae-ae2f559c16b7" />

Fig.4 

<img width="964" height="637" alt="fhabla" src="https://github.com/user-attachments/assets/91f794fc-7526-41ff-8cdd-6f90a2940113" />




> ### Parte B
En la presente sección, se aborda la etapa de adquisición temporizada en MATLAB y caracterización espectral de la señal respiratoria por medio del sistema desarrollado en la Parte A. Empleando el entorno de MATLAB, se registraron dos señales de 30 segundos en dos escenarios fisiológicos contrastantes; estado de **reposo** y durante **habla/lectura**. A partir de estas señales, se evalúa la necesidad de filtrado digital y se aplica la *Transformada Rápida de Fourier (FFT)* con el fin de identificar las frecuencias dominantes asociadas al patrón de respiración humana en cada condición. 

### **1. Adquisición temporizada de la señal**
Para adquirir las señal respiratoria de carácter análogo proveniente de la configuración desarrollada en la Parte A, se utilizó el aplicativo ***Analog Imput Recorder*** perteneciente a *Data Acquisition Toolbox* integrado en MATLAB. Esta aplicación permite adquirir y visualizar señales provenientes de dispositivos de adquisición compatibles con MATLAB. En este caso, se utilizó un módulo *NI-DAQmx*, el cual realizó la conversión ADC hacia la computadora.

Posteriormente, en la interfaz de ***Analog Imput Recorder***, se configuró el tiempo de adquisición de las señales $T_s$ y la frecuencia de muestreo $f_s$ como se muestra a continuación:

$$T_s=30\ s$$
$$f_s=1\ kHz$$

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

### **4. Análisis en el dominio de la Frecuencia**

Para caracterizar el comportamiento espectral de las señales respiratorias, se procesaron los registros en reposo y durante el habla utilizando la _Transformada Rápida de Fourier (FFT)_ en MATLAB. A continuación, se presenta el procedimiento en MATLAB para obtener el espectro de potencia de la **señal de reposo:**

```matlab
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
```
Este flujo se estructuró bajo las siguientes etapas:

* **Remoción de componente DC:** Resta del valor medio (`mean()`) para eliminar la desviación de voltaje continuo, con tal de evitar que la magnitud de $0\ Hz$ predomine ante las frecuencias fisiológicas de interés.
  
* **Cálculo FFT:** Obtención de la Transformada Discreta de Fourier por medio de la función `fft()`, utilizando la longitud total de muestras `N_rep`.

* **Cálculo del Espectro de Potencia:** Módulo de la FFT al cuadrado, normalizado entre el número total de puntos $\left(P(f)=\frac{|Y(f)|^2}{N}\right)$.

* **Vector de frecuencias y simetría:** Construcción del eje de frecuencias partiendo de la frecuencia de muestreo $f_s=1000\ Hz$ y toma de la mitad positiva del espectro $\left(0\ a\ \frac{f_s}{2}\ Hz\right)$. La función `floor()` redondea hacia el entero más cercano menor o igual al número original, evitando un error al recortar el vector de frecuencias.

Para visualizar la representación en el dominio de la frecuencia, se graficó la PSD delimitando el rango visual de $0$ a $5\ Hz$, intervalo que abarca la totalidad de la banda de interés respiratorio humano, como se muestra en seguida:

```matlab
figure;
plot(f_rep, P_rep, 'LineWidth', 1.5);
xlim([0 5]);
grid on;
xlabel('Frecuencia (Hz)');
ylabel('Potencia');
title('Espectro de potencia - Reposo');
```
> [!NOTE]
> El proceso para la **señal de habla** es análogo al anteriormente enunciado.

Así, la representación en frecuencia de las señales estudiadas se muestra en el apartado siguiente.

#### **REPOSO**

<img width="1373" height="912" alt="image" src="https://github.com/user-attachments/assets/0b2b56a4-fa68-4e54-8ec4-071050c994d5" />

#### **HABLA**

<img width="1373" height="912" alt="image" src="https://github.com/user-attachments/assets/7b84b937-55dd-42ba-b3f7-86bec2d64c49" />

### **5. Espectro Dominante - Frecuencia Respiratoria**

Con el fin de determinar el ritmo respiratorio característico en ambas condiciones, se realizó la detección automática de los picos de máxima potencia en los espectros previamente calculados, mediante la siguiente estructura:

```matlab
%% Frecuencias Dominantes

[~,idx_rep] = max(P_rep(2:end));
idx_rep = idx_rep + 1;

[~,idx_hab] = max(P_hab(2:end));
idx_hab = idx_hab + 1;

disp('----- FRECUENCIAS DOMINANTES -----')
fprintf('Reposo: %.3f Hz\n',f_rep(idx_rep));
fprintf('Habla: %.3f Hz\n',f_hab(idx_hab));
```
Se implementa la función `max()` sobre los vectores de las potencias (`P_rep` y `P_hab`) a partir del segundo elemento, evitando componentes DC indeseadas. Es necesario ajustar los índices (`idx + 1`), dado que la búsqueda omite el primer elemento, se suma $1$ para alinearlos correctamente con la posición real del vector de frecuencias (`f_rep` y `f_hab`).

La obtención de la frecuencia respiratoria (RPM) emplea la frecuencia dominante $f_d$ encontrada para cada señal; simplemente se multiplica por $60$ siguiendo esta simple guía:

$$f_d\left(\frac{respiraciones}{segundo}\right) \times 60\ \left(\frac{segundos}{minuto}\right) = 60f_d\left(\frac{respiraciones}{minuto}\right)$$

En MATLAB, se implementó de la siguiente forma:

```matlab
%% Frecuencias Respiratorias

disp('----- FRECUENCIAS RESPIRATORIAS -----');
fprintf('Reposo: %.2f respiraciones/min\n',60*f_rep(idx_rep));
fprintf('Habla: %.2f respiraciones/min\n',60*f_hab(idx_hab));
```
La frecuencia dominante $f_d$ se obtiene por medio de `f(idx)` para cada señal respectivamente, dónde se accede a la posición exacta dada por el índice previamente encontrado con la función `max()`.

#### **RESULTADOS**
Los datos numéricos visualizados en el _Command Window_ de MATLAB para la frecuencia dominante y la frecuencia respiratoria son los siguientes:

#### **_Frecuencia Dominante_**
* **Reposo:** $0.267\ Hz$
* **Habla:** $0.067\ Hz$

#### **_Frecuencia Respiratoria_**
* **Reposo:** $16.00\ rpm$
* **Habla:** $4.00\ rpm$

> ### Parte C

### 1. Resultados Obtenidos

**Señales en el dominio del tiempo**

En reposo, la señal respiratoria mostró ciclos bien definidos, con una amplitud que decrece progresivamente a lo largo de los 30 s de registro pero manteniendo una periodicidad clara entre picos y valles, lo que sugiere un proceso ventilatorio estable durante la ventana de captura. Durante el habla, en cambio, la señal presentó un comportamiento mucho más dinámico, con valles profundos y asimétricos, tramos de caída rápida seguidos de mesetas y repuntes abruptos, reflejo directo de las pausas para inspirar entre frases y de la espiración prolongada y controlada propia de la fonación.

**Señales en el dominio de la frecuencia**

El espectro de potencia en reposo presentó un pico dominante claro y estrecho, indicando un proceso altamente periódico y con poca dispersión de energía en frecuencias cercanas. En el espectro correspondiente al habla, si bien también se identificó un pico dominante, la energía apareció distribuida entre este y varios picos secundarios próximos, evidenciando la mayor riqueza espectral asociada a la estructura del habla (frases, pausas, énfasis).

**Frecuencias obtenidas**

| Condición | Frecuencia Dominante ($f_d$) | Frecuencia Respiratoria (rpm) |
|-----------|:---:|:---:|
| Reposo | 0.267 Hz | 16.00 |
| Habla  | 0.067 Hz | 4.00 |

---

### 2. Análisis de Resultados

**Semejanzas y diferencias entre la frecuencia y relación inhalación/exhalación en reposo y durante la verbalización**

Los resultados evidencian una diferencia marcada entre ambas condiciones, tanto en el dominio del tiempo como en el de la frecuencia. En reposo, la periodicidad clara de la señal se tradujo en un pico espectral único y dominante en 0.267 Hz, equivalente a 16 rpm, valor que se ubica dentro del rango eupneico normal para un adulto sano (12–20 rpm) y que refleja una relación inspiración/espiración relativamente simétrica y estable, propia del control automático de la ventilación regulado por los centros bulbares en respuesta a las necesidades metabólicas de oxígeno y a la eliminación de dióxido de carbono.

Durante el habla, la mayor dinámica de la señal en el dominio del tiempo se correspondió con un espectro donde la energía se distribuyó entre un pico dominante en 0.067 Hz (4 rpm) y varios picos secundarios cercanos, en contraste con la concentración espectral observada en reposo. Cuantitativamente, la frecuencia respiratoria dominante se redujo a la cuarta parte durante el habla. Esto no significa que el sujeto respire cuatro veces más lento en sentido literal, sino que cambia la unidad funcional del ciclo respiratorio: en reposo el ciclo está gobernado por la demanda metabólica, generando inspiraciones y espiraciones de duración comparable, mientras que en el habla el ciclo dominante pasa a estar gobernado por la duración de las frases y las pausas para respirar entre ellas, con inspiraciones breves y profundas seguidas de espiraciones considerablemente más prolongadas, lentas y controladas activamente por la musculatura intercostal y abdominal para sostener la emisión sonora. Esta reorganización temporal del ciclo, más que una simple reducción de la frecuencia, refleja un cambio cualitativo en la función que cumple la respiración: de ser un proceso puramente metabólico pasa a subordinarse, sin dejar de cumplir su función de intercambio gaseoso, a las exigencias motoras del habla.

**Alcance del sistema para la caracterización del proceso respiratorio**

El sistema desarrollado, basado en la medición de la concentración de gases exhalados mediante el sensor MQ-135 acoplado a una máscara de nebulización, demostró ser eficaz para capturar de forma no invasiva cambios generales en el patrón ventilatorio y estimar una frecuencia respiratoria dominante coherente con la fisiología esperada, permitiendo diferenciar con claridad estados fisiológicos distintos como el reposo y el habla, e incluso cuantificar objetivamente la magnitud de dicha diferencia mediante el análisis espectral.

Este enfoque resulta particularmente útil como herramienta de monitoreo general y de aprendizaje en instrumentación biomédica, ya que permite observar de manera directa cómo distintas condiciones fisiológicas y comportamentales modifican el patrón respiratorio, sin requerir contacto invasivo con el sujeto. Su alcance natural se sitúa en aplicaciones de monitoreo de tendencias y comparación entre condiciones, como la realizada en esta práctica, donde el interés principal es identificar cambios relativos en la frecuencia y morfología respiratoria más que obtener mediciones absolutas de alta precisión clínica. Un desarrollo posterior orientado a aplicaciones de diagnóstico podría complementarse con variables adicionales, como el movimiento torácico o el flujo de aire, y con tiempos de registro más extensos, para ampliar el nivel de detalle y especificidad de la caracterización respiratoria.

---

### 3. Preguntas para la Discusión

**Pregunta 1: ¿Son los patrones respiratorios y frecuencias respiratorias iguales o diferentes en cada caso? ¿A qué se debe esto?**

Son diferentes, tanto en frecuencia (16 rpm en reposo frente a 4 rpm en habla) como en morfología del ciclo. Esto se explica por un cambio en el mecanismo de control de la respiración: en reposo, la ventilación está regulada de forma automática por los centros respiratorios del bulbo raquídeo y la protuberancia, en función de las concentraciones de O₂ y CO₂ en sangre, produciendo ciclos simétricos y periódicos donde los tiempos de inspiración y espiración son relativamente comparables. 

Durante el habla, el control pasa a depender en gran medida de la corteza cerebral, que subordina la respiración a las exigencias del lenguaje: la inspiración se vuelve breve y profunda para maximizar rápidamente el volumen de aire disponible, mientras que la espiración se prolonga considerablemente y se modula activamente mediante los músculos intercostales y abdominales para mantener un flujo de aire constante y controlado que sostenga la fonación durante toda la frase. Este cambio de control automático a control voluntario es la causa fisiológica principal de las diferencias observadas tanto en el dominio del tiempo, donde se aprecia la mayor dinámica del ciclo, como en el dominio de la frecuencia, donde se observa la distribución de la energía espectral y la reducción de la frecuencia dominante.

**Pregunta 2: ¿Cuáles serían las ventajas y desventajas de emplear múltiples sensores para el monitoreo del proceso respiratorio? ¿Cuáles podrían ser las razones?**

El uso de múltiples sensores, por ejemplo combinando el sensor de gases empleado en esta práctica con un sensor de movimiento torácico o de flujo de aire, permitiría capturar simultáneamente distintas manifestaciones físicas de un mismo proceso fisiológico. La principal ventaja es la posibilidad de validar de manera cruzada la información: si dos sensores basados en principios físicos distintos coinciden en la frecuencia respiratoria detectada, la confiabilidad de la medición aumenta considerablemente. Además, distintos sensores son sensibles a distintos aspectos del ciclo respiratorio, ya que el movimiento torácico refleja mejor la amplitud y regularidad del ciclo mientras que la concentración de CO₂ refleja mejor el intercambio gaseoso propiamente dicho, por lo que su combinación permite una caracterización más completa y robusta del proceso, capaz de sustentar interpretaciones clínicas con mayor nivel de confianza.

La principal desventaja es el aumento de la complejidad del sistema, pues se requiere sincronizar temporalmente varias señales, acondicionar cada una con su propio circuito de adquisición y desarrollar algoritmos que combinen adecuadamente la información de cada canal, lo que incrementa el costo, el consumo energético y el tamaño del dispositivo. La razón de fondo detrás de esta relación costo-beneficio es que cada variable física captura una dimensión parcial del proceso respiratorio (mecánica, térmica, química o de presión), por lo que la decisión de usar uno o varios sensores depende del equilibrio entre la robustez y completitud de la información requerida por la aplicación y la complejidad que el sistema puede asumir en términos de costo, tamaño y facilidad de uso.

---

### 4. Conclusiones
La comparación entre las condiciones de reposo y habla permite concluir que el patrón respiratorio no es un proceso rígido, sino que se adapta dinámicamente según la tarea que el sujeto esté realizando, pasando de un control automático y periódico, orientado a satisfacer las necesidades metabólicas, a un control voluntario y modulado por las exigencias del habla. Esta transición se evidenció tanto en el dominio del tiempo, mediante el cambio en la regularidad de la señal, como en el de la frecuencia, mediante la reducción de la frecuencia dominante y la mayor riqueza espectral.

De las variables físicas revisadas, el movimiento torácico y abdominal resulta ser una de las más adecuadas para detectar posibles anomalías respiratorias, al reflejar directamente la mecánica ventilatoria en amplitud y regularidad. Esto no resta valor a la concentración de CO₂ empleada en esta práctica, cuya fortaleza radica en reflejar el intercambio gaseoso propiamente dicho, siendo un complemento valioso en un sistema de monitoreo más completo.

El sistema desarrollado, basado en un sensor MQ-135 acoplado a una máscara de nebulización, cumplió su objetivo de evidenciar de forma clara y cuantificable el efecto del habla sobre el patrón y la frecuencia respiratoria. El análisis espectral mediante FFT permitió pasar de una observación cualitativa en el tiempo a una caracterización cuantitativa del contenido frecuencial, demostrando que un sistema de instrumentación sencillo puede aportar información fisiológicamente coherente sobre el proceso respiratorio y su relación con el habla.

