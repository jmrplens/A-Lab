
# ** Under construction (will be published early)

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate?hosted_button_id=BLP3R6VGYJB4Q) 
[![Donate](https://img.shields.io/badge/Donate-Ko--fi-brightgreen?color=ff5f5f)](https://ko-fi.com/jmrplens) 

# A|Lab
Matlab-based software for measuring acoustic parameters and experiments. (**A**coustic **Lab**oratory).

This software is made up of different types of measurement (impedance tube, anechoic chamber, general, etc.) and expansion modules for different specific projects. The software is under development and will be adding more measures.

The software has been made with the collaboration of the Escuela Politècnica Superior de Gandia (Universitat Politècnica de València), mainly giving access to equipment and instrumentation.

## The heart of the app

# Table of contents
<!-- MarkdownTOC autolink="true" autoanchor="true" levels="1,2,3,4" -->

- [General](#general)
  - [Device setup and calibration](#device-setup-and-calibration)
    - [Hardware configuration](#hardware-configuration)
    - [Calibrate latency](#calibrate-latency)
    - [Calibrate inputs](#calibrate-inputs)
    - [Air parameters](#air-parameters)
  - [Signal panel](#signal-panel)
  - [Information panel](#information-panel)
- [Methods](#methods)
  - [General](#general-1)
  - [Impedance Tube \(ISO 10534-2\)](#impedance-tube-iso-10534-2)
    - [Tube parameters](#tube-parameters)
    - [One-Mic measurement](#one-mic-measurement)
    - [Two-Mic measurement](#two-mic-measurement)
      - [Calibrate the impedance tube system](#calibrate-the-impedance-tube-system)
    - [Information panel](#information-panel-1)
    - [Results visualization](#results-visualization)
  - [Transmission Tube \(ASTM 2611\)](#transmission-tube-astm-2611)
    - [Tube parameters](#tube-parameters-1)
    - [One-Mic measurement](#one-mic-measurement-1)
    - [Two-Mic measurement](#two-mic-measurement-1)
    - [Four-Mic measurement](#four-mic-measurement)
      - [Calibrate the transmission tube system](#calibrate-the-transmission-tube-system)
    - [Measure information](#measure-information)
    - [Results visualization](#results-visualization-1)
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
<img src="http://jmrplens.com/GitHub_ALab/devicepanelc.png" width="70%"></img> 
</p>

Options:
  - **Harware configuration**: Sample rate, Samples per Frame, Device driver, Audio device and Bit depth.
  - **Calibrate latency**: Selects the input and output channel and calibrates automatically.
  - **Calibrate inputs**: Select calibrator signal level, input channel and run calibration.
  - **Air parameters**: Sound speed and air density.

<a id="hardware-configuration"></a>
### Hardware configuration

<a id="calibrate-latency"></a>
### Calibrate latency

<a id="calibrate-inputs"></a>
### Calibrate inputs

<a id="air-parameters"></a>
### Air parameters

<a id="signal-panel"></a>
## Signal panel
The signal selection panel appears in all types of measurement. 

<img width="225" src="http://jmrplens.com/GitHub_ALab/sweepPanel.png"></img>

The available signals depend on the chosen measurement method, in total the following signals are available:
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
  * Custom signal

    If you want to use a different signal you can import it by selecting it within this panel. The signal must be in a text file with a single column, the sampling frequency will be the one defined in the application configuration.

All signals are normalized between 0.5 and -0.5: `signal = (signal/max(abs(signal)))*0.5;`.

<a id="information-panel"></a>
## Information panel
 <img align="left" height="150" src="http://jmrplens.com/GitHub_ALab/infoPanel.png"></img> This panel always appears in the bar on the right. Displays the relevant information of the audio device.
 If latency calibration has not been performed it shows the approximate value (`SamplesPerFrame/SampleRate*2`) but this value is not applied to signals.
 If at least one input of the device has been calibrated, the word 'Yes' will be displayed in the input calibration.

<p><br /><br /></p>

<a id="methods"></a>
# Methods


<a id="general-1"></a>
## General

This method is only to perform some tests and see some options that MATLAB offers us, such as the calculation of common parameters in sound level meters.
**Remember: only for test.**

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/GeneralMethod.png" width="49%"></img>
</p>


<a id="impedance-tube-iso-10534-2"></a>
## Impedance Tube (ISO 10534-2)

The impedance tube method is detailed in <a href="https://www.iso.org/standard/22851.html">ISO 10534-2</a>. In this program the measure has been implemented in full compliance with the standard.

The steps to follow (also indicated in the standard) are:
  1. (Recommended) Calibrate the inputs to be used (<a href="#device-setup-and-calibration">configuration panel</a>).
  1. Enter tube parameters (distances and shape).
  1. (Recommended) Calibrate the impedance tube system (if you use two microphones).
  1. Measure.
 
The results obtained are: Reflection factor, Sound absorption coefficient, Specific acoustic impedance, Impulse response (two inputs) and Frequency response (two inputs).

The side panels that appear in this measurement method are:
* **Left panel**: Here you can open the tube parameter configuration panel, measure with one or two microphones or review the information of the measurement method.
* **Right panel**: Here you can choose the type of signal and its parameters. You will also have information about the tube and the audio hardware.

|Left panel|Right panel|
|:-------:|:------:|
|<img src="http://jmrplens.com/GitHub_ALab/ImpedanceTubeLeftc.png" width="50%"></img>|<img src="http://jmrplens.com/GitHub_ALab/ImpedanceTubeRightc.png" width="50%"></img>|


<a id="tube-parameters"></a>
### Tube parameters

Enter in this panel the geometric parameters of the tube: Shape, distance between microphones and distance to the sample. Remember, measure all dimensions correctly.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/ImpedanceTubeParametersc.png" width="49%"></img>
</p>

<a id="one-mic-measurement"></a>
### One-Mic measurement

If you only have one microphone, you can perform the measurement through this panel.
First place the microphone in position [A] and press `Measure [A]`, then move the microphone to position [B] and press `Measure [B]`. Finally, click on the button `Calculate results` in the right panel.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/ImpedanceTubeOneMicc.png" width="49%"></img>
</p>

<a id="two-mic-measurement"></a>
### Two-Mic measurement

To measure with two microphones simply place the microphones in position and press `Measure`.
You can also calibrate the system by pressing `Calibrate (optional)`.
Once the measurement is finished, press the button `Calculate results` in the right panel. If you have calibrated the tube, the program will ask you if you want to use the calibration.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/ImpedanceTubeTwoMicc.png" width="49%"></img>
</p>

<a id="calibrate-the-impedance-tube-system"></a>
#### Calibrate the impedance tube system

To calibrate the system, two measurements must be made, one with the normal microphone position, and one with the swapped position.
It is also advisable to have an absorbent material to slightly reduce reflections.
The figures indicate the position of the microphones for each measurement, make sure they are located correctly before measuring. Once the two measurements are finished, click on `Return`.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/ImpedanceTubeTwoMicCalc.png" width="49%"></img>
</p>

<a id="information-panel-1"></a>
### Information panel
In this panel you will see a summary of the measurement method and the limitations according to the tube parameters.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/ImpedanceTubeInformationc.png" width="49%"></img>
</p>

<a id="results-visualization"></a>
### Results visualization

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/ImpedanceTubeResultsc.png" width="49%"></img>
</p>

<a id="transmission-tube-astm-2611"></a>
## Transmission Tube (ASTM 2611)

The transmission tube method is detailed in <a href="https://www.astm.org/Standards/E2611.htm">ASTM 2611</a>. In the program the method is implemented to be able to use one, two or four microphones. It is necessary to have a transmission tube with 4 microphone positions, two on the upstream side and two on the downstream side.

If the sample to be analyzed is symmetrical, only an anechoic end of the tube is necessary. If it is not symmetric, it will be necessary to measure with anechoic end and with rigid end.

The steps to follow (also indicated in the standard) are:
  1. (Recommended) Calibrate the inputs to be used (<a href="#device-setup-and-calibration">configuration panel</a>).
  1. Enter tube parameters (distances and shape).
  1. (Recommended) Calibrate the impedance tube system (if you use four microphones).
  1. Measure with anechoic end and, if not symmetrical sample, repeat measure with rigid end.
 
The results obtained are: Transmission loss, Impedance, Transmission factor, Reflection factor, Propagation wavenamber in material, Sound absorption coefficient, Impulse response and Frequency response (four inputs) for anechoic and rigid end measure (if not symmetrical).

The side panels that appear in this measurement method are:
* **Left panel**: Here you can open the tube parameter configuration panel, measure with one, two or four microphones or review the information of the measurement method.
* **Right panel**: Here you can choose the type of signal and its parameters. You will also have information about the tube and the audio hardware.

|Left panel|Right panel|
|:-------:|:------:|
|<img src="http://jmrplens.com/GitHub_ALab/TransmissionTubeLeft.png" width="50%"></img>|<img src="http://jmrplens.com/GitHub_ALab/TransmissionTubeRightc.png" width="50%"></img>|

<a id="tube-parameters-1"></a>
### Tube parameters
The panel shown here is used to enter the geometric parameters of the tube. Remember, measure all dimensions correctly.

Also do not forget to indicate the shape of the tube.
<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/TransmissionTubeParams.png" width="49%"></img>
</p>

<a id="one-mic-measurement-1"></a>
### One-Mic measurement
If you only have one microphone, it is possible to perform the measurement by placing the microphone in each of the measurement positions.

Each time a measurement is made the graph is updated to show which parts have already been measured. Also, if you are not sure that you have carried out the measurement correctly, you can delete it and do it again.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/TransmissionTube1mic.png" width="49%"></img>
</p>

<a id="two-mic-measurement-1"></a>
### Two-Mic measurement
If you have two microphones you can perform the measurement faster than the one microphone option.

The operation is the same, except that now two input channels are chosen, one for each microphone.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/TransmissionTube2mic.png" width="49%"></img>
</p>

<a id="four-mic-measurement"></a>
### Four-Mic measurement
This is the best option, it reduces errors when manipulating the position of the microphones obtaining better results (although it is not a big difference).

This option also allows you to calibrate the microphones before making the measurement.
<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/TransmissionTube4mic.png" width="49%"></img>
</p>

<a id="calibrate-the-transmission-tube-system"></a>
#### Calibrate the transmission tube system

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/TransmissionTube4micCal.png" width="49%"></img>
</p>

<a id="measure-information"></a>
### Measure information
In this panel you will see some information about the measurement method.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/TransmissionTubeInformation.png" width="49%"></img>
</p>

<a id="results-visualization-1"></a>
### Results visualization
When you press the button to calculate results, you will see this panel with the different results defined by the standard. If you click on any of the graphs you can see it larger.

Also, if you press the button for other results, you will be able to see the impulse response and the frequency response of all the measurements.

In the main results panel you can choose to export all the results in text file or if you click on any graph you can export in text file only that result.
<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/TransmissionTubeResults.png" width="49%"></img>
</p>

<a id="standards-and-theory"></a>
# Standards and theory

Here is a table of the sources used for the implementation of some of the measures implemented in the software.

| Measure | Source | M-File |
|:-------:|:------:|:------:|
| Impedance tube | <a href="https://www.iso.org/standard/22851.html">ISO 10534-2:1998</a>   | |
| Transmission tube | <a href="https://www.astm.org/Standards/E2611.htm">ASTM 2611 - 19</a> | `calculationsFourMicASTM2611.m` |

<a id="supports"></a>
# Supports

<a href="http://www.upv.es"><img align="Left" height="100" src="http://jmrplens.com/GitHub_ALab/LogoUPV2.png"></img></a><a href="http://www.gandia.upv.es/"><img align="Left" height="100" src="http://jmrplens.com/GitHub_ALab/LogoEPSG2.png"></img></a> ***Thanks to the Universitat Politècnica de València and the Escuela Politècnica Superior de Gandia for providing the necessary equipment to develop some of the measures implemented in the program.***

<p><br /><br /></p>
More to add.....

<a id="author"></a>
# Author
Jose M. Requena Plens, 2021. (joreple@upv.es)

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate?hosted_button_id=BLP3R6VGYJB4Q)
[![Donate](https://img.shields.io/badge/Donate-Ko--fi-brightgreen?color=ff5f5f)](https://ko-fi.com/jmrplens) 
