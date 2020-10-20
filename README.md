# ** Under construction (will be published in november)

## A-Lab
Matlab-based software for measuring acoustic parameters and experiments.

This software is made up of different types of measurement (impedance tube, anechoic chamber, general, etc.) and expansion modules for different specific projects.

### General
#### Device setup and calibration

In this panel you can configure the parameters of the audio device and calibrate the system latency (useful for correcting delays in the impulse response). Also, if you have a microphone calibrator, you can calibrate each input channel.

<p align="center">
<img src="http://jmrplens.com/GitHub_ALab/devicepanel.png" width="70%"></img> 
</p>

Options:
  - Harware configuration: Sample rate, Samples per Frame, Device driver, Audio device and Bit depth.
  - Calibrate latency: Selects the input and output channel and calibrates automatically.
  - Calibrate inputs: Select calibrator signal level, input channel and run calibration.

#### Signal panel
The signal selection panel always appears in the bar on the right. The available signals depend on the chosen measurement method, in total the following signals are available:
  * MLS
    ```matlab
          fs; % Sample rate
    duration; % Duration in seconds of a sequence
        nseq; % Number of sequences
        
        signal = mls(fs*duration+1);
        signal = repmat(signal,nseq,1);
        signal = [signal;zeros(fs*duration+1,1)];
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
    
        signal = randn(duration*fs,1);
    ```
  * Pink Noise
    ```matlab
          fs; % Sample rate
    duration; % Duration in seconds
    
        signal = pinknoise(duration*fs);
    ```
  * Pure Tone
    ```matlab
          fs; % Sample rate
    duration; % Duration in seconds
        freq; % Tone frequency in hertz
        
        signal = cos(2*pi*freq*(0:1/fs:duration));
    ```

All signals are normalized between 0.5 and -0.5: `signal = (signal/max(abs(signal)))*0.5;`.

#### Information panel
 <img align="left" height="150" src="http://jmrplens.com/GitHub_ALab/infoPanel.png"></img> This panel always appears in the bar on the right. Displays the relevant information of the audio device.
 
If latency calibration has not been performed it shows the approximate value (`SamplesPerFrame/SampleRate*2`) but this value is not applied to signals.

If at least one input of the device has been calibrated, the word 'Yes' will be displayed in the input calibration.


### Methods

#### Impedance Tube

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


### Supports

<a href="http://www.upv.es"><img align="Left" height="100" src="http://jmrplens.com/GitHub_ALab/LogoUPV.png"></img></a><a href="http://www.gandia.upv.es/"><img align="Left" height="100" src="http://jmrplens.com/GitHub_ALab/LogoEPSG.png"></img></a> ***Thanks to the Universitat Politècnica de València and the Escuela Politècnica Superior de Gandia for providing the necessary equipment to develop some of the measures implemented in the program.***
