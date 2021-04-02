
# ** Under construction (will be published early)

# A|Lab
Matlab-based software for measuring acoustic parameters and experiments. (**A**coustic **Lab**oratory).

This software is made up of different types of measurement (impedance tube, anechoic chamber, general, etc.) and expansion modules for different specific projects. The software is under development and will be adding more measures.

The software has been made with the collaboration of the Escuela Politècnica Superior de Gandia (Universitat Politècnica de València), mainly giving access to equipment and instrumentation.

<!-- MarkdownTOC autolink="true" autoanchor="true" levels="1,2,3" -->

- [General](#general)
  - [Device setup and calibration](#device-setup-and-calibration)
  - [Signal panel](#signal-panel)
  - [Information panel](#information-panel)
- [Methods](#methods)
  - [Aeroacoustics](#aeroacoustics)
  - [Impedance Tube](#impedance-tube)
  - [Transmission Tube](#transmission-tube)
    - [Tube parameters](#tube-parameters)
    - [Measurement](#measurement)
    - [Measure information](#measure-information)
    - [Results visualization](#results-visualization)
- [Standards and theory](#standards-and-theory)
- [Supports](#supports)
- [Author](#author)

<!-- /MarkdownTOC -->

<a id="general"></a>
# General
<a id="device-setup-and-calibration"></a>
## Device setup and calibration

In this panel you can configure the parameters of the audio device and calibrate the system latency (useful for correcting delays in the impulse response). Also, if you have a microphone calibrator, you can calibrate each input channel.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/devicepanel.png" width="70%"></img> 
</p>

Options:
  - Harware configuration: Sample rate, Samples per Frame, Device driver, Audio device and Bit depth.
  - Calibrate latency: Selects the input and output channel and calibrates automatically.
  - Calibrate inputs: Select calibrator signal level, input channel and run calibration.

<a id="signal-panel"></a>
## Signal panel
The signal selection panel appears in all types of measurement. The available signals depend on the chosen measurement method, in total the following signals are available:
  * MLS
    ```matlab
          fs; % Sample rate
    duration; % Duration in seconds of a sequence
        nseq; % Number of sequences
        
        signal = mls(round(fs*duration+1));
        signal = repmat(signal,nseq,1);
        signal = [signal;zeros(round(fs*duration+1),1)];
    ```
  * Sweep
    ```matlab
          fs; % Sample rate
    duration; % Duration in seconds
     dur_sil; % Silence duration in seconds
        fini; % Initial frequency in hertz
        fend; % End frequency in hertz
        
        signal = sweeptone(duration,dur_sil,fs,'SweepFrequencyRange',[fini,fend]);
    ```
  * White Noise
    ```matlab
          fs; % Sample rate
    duration; % Duration in seconds
    
        signal = randn(round(duration*fs),1);
    ```
  * Pink Noise
    ```matlab
          fs; % Sample rate
    duration; % Duration in seconds
    
        signal = pinknoise(round(duration*fs));
    ```
  * Pure Tone
    ```matlab
          fs; % Sample rate
    duration; % Duration in seconds
        freq; % Tone frequency in hertz
        
        signal = cos(2*pi*freq*(0:1/fs:duration));
    ```

All signals are normalized between 0.5 and -0.5: `signal = (signal/max(abs(signal)))*0.5;`.

<a id="information-panel"></a>
## Information panel
 <img align="left" height="150" src="http://jmrplens.com/GitHub_ALab/infoPanel.png"></img> This panel always appears in the bar on the right. Displays the relevant information of the audio device.
 If latency calibration has not been performed it shows the approximate value (`SamplesPerFrame/SampleRate*2`) but this value is not applied to signals.
 If at least one input of the device has been calibrated, the word 'Yes' will be displayed in the input calibration.

<p><br /><br /></p>

<a id="methods"></a>
# Methods


<a id="aeroacoustics"></a>
## Aeroacoustics

<a id="impedance-tube"></a>
## Impedance Tube

The impedance tube method is detailed in ISO 10534-2. In this program the measure has been implemented in full compliance with the standard.

The steps to follow (also indicated in the standard) are:
  1. It is recommended to calibrate the inputs to be used.
  1. Enter tube parameters (distances and shape).
  1. Calibrate the impedance tube system.
  1. Measure.
 
 The results obtained are: Absolute value of reflection factor, Angle of reflection factor, Sound absorption coefficient, Specific acoustic impedance, Impulse response (two inputs) and Frequency response (two inputs).

Below are some screenshots of this measure. You can see the results panel and export results, the tube calibration panel and the tube information panel.

<img src="http://jmrplens.com/GitHub_ALab/impedanceTube1.png" width="49%"></img> <img src="http://jmrplens.com/GitHub_ALab/impedanceTube2.png" width="49%"></img> 
<img src="http://jmrplens.com/GitHub_ALab/impedanceTube3.png" width="49%"></img> <img src="http://jmrplens.com/GitHub_ALab/impedanceTube4.png" width="49%"></img> 

<a id="transmission-tube"></a>
## Transmission Tube

The transmission tube method is detailed in <a href="https://www.astm.org/Standards/E2611.htm">ASTM 2611</a>. In the program the method is implemented to be able to use one, two or four microphones. It is necessary to have a transmission tube with 4 microphone positions, two on the upstream side and two on the downstream side.

If the sample to be analyzed is symmetrical, only an anechoic end of the tube is necessary. If it is not symmetric, it will be necessary to measure with anechoic end and with rigid end.

<a id="tube-parameters"></a>
### Tube parameters
The panel shown here is used to enter the geometric parameters of the tube. Remember, measure all dimensions correctly.

Also do not forget to indicate the shape of the tube.
<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/transmissionTubeParameters.png" width="70%"></img>
</p>

<a id="measurement"></a>
### Measurement

<a id="one-mic-measurement"></a>
#### One-Mic measurement
If you only have one microphone, it is possible to perform the measurement by placing the microphone in each of the measurement positions.

Each time a measurement is made the graph is updated to show which parts have already been measured. Also, if you are not sure that you have carried out the measurement correctly, you can delete it and do it again.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/transmissionTube1micmeasure.png" width="70%"></img>
</p>

<a id="two-mic-measurement"></a>
#### Two-Mic measurement
If you have two microphones you can perform the measurement faster than the one microphone option.

The operation is the same, except that now two input channels are chosen, one for each microphone.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/transmissionTube2micmeasure.png" width="70%"></img>
</p>

<a id="four-mic-measurement"></a>
#### Four-Mic measurement
This is the best option, it reduces errors when manipulating the position of the microphones obtaining better results (although it is not a big difference).

This option also allows you to calibrate the microphones before making the measurement.
<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/transmissionTube4micmeasure.png" width="70%"></img>
</p>

<a id="measure-information"></a>
### Measure information
In this panel you will see some information about the measurement method.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/transmissionTube4information.png" width="70%"></img>
</p>

<a id="results-visualization"></a>
### Results visualization
When you press the button to calculate results, you will see this panel with the different results defined by the standard. If you click on any of the graphs you can see it larger.

Also, if you press the button for other results, you will be able to see the impulse response and the frequency response of all the measurements.

In the main results panel you can choose to export all the results in text file or if you click on any graph you can export in text file only that result.
<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/transmissionTube4results.png" width="70%"></img>
</p>

<a id="standards-and-theory"></a>
# Standards and theory

Here is a table of the sources used for the implementation of some of the measures implemented in the software.

| Measure | Source |
|:-------:|:------:|
| Impedance tube | <a href="https://www.iso.org/standard/22851.html">ISO 10534-2:1998</a>   |
| Transmission tube | <a href="https://www.astm.org/Standards/E2611.htm">ASTM 2611 - 19</a> |

<a id="supports"></a>
# Supports

<a href="http://www.upv.es"><img align="Left" height="100" src="http://jmrplens.com/GitHub_ALab/LogoUPV2.png"></img></a><a href="http://www.gandia.upv.es/"><img align="Left" height="100" src="http://jmrplens.com/GitHub_ALab/LogoEPSG2.png"></img></a> ***Thanks to the Universitat Politècnica de València and the Escuela Politècnica Superior de Gandia for providing the necessary equipment to develop some of the measures implemented in the program.***

<p><br /><br /></p>
More to add.....

<a id="author"></a>
# Author
Jose M. Requena Plens, 2020. (info@jmrplens.com   | joreple@upv.es)
