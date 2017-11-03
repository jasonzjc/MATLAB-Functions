%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Jeff Zhao
%   11/02/2017
%
%   FIR low pass filter design
%
%   Originally from https://www.mathworks.com/help/dsp/ug/lowpass-filter-design.html#d119e556
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clearvars;
close all;

% design requirement
Fs  = 48e3;     % sampling rate
Fp  = 8e3;      % passband-edge
Fst = 10e3;		% stopband-edge
Ap  = 0.01;     % passband ripple
Ast = [80, 90];       % stopband attenuation

% obtain the maximum deviation for the passband and stopband ripples in linear units
NUM1 = MinOrdLPFIR(Fs, Fp, Fst, Ap, Ast(1));
NUM2 = MinOrdLPFIR(Fs, Fp, Fst, Ap, Ast(2));
hvft = fvtool(NUM1,1,NUM2,1,'Fs',Fs);
legend(hvft,'Stopband Attenuation = 80 dB','Stopband Attenuation = 90 dB');