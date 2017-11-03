%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Jeff Zhao
%   11/02/2017
%
%   Minimum Order FIR low pass filter design
%
%   Originally from https://www.mathworks.com/help/dsp/ug/lowpass-filter-design.html#d119e556
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ Num ] = MinOrdLPFIR( Fs, Fp, Fst, Ap, Ast )
%Design minimum order FIR low pass filter
%   Num = MinOrdLPFIR(Fs, Fp, Fst, Ap, Ast)
%   Num is the FIR filter coefficient vector
%   Fs: sampling frequency
%   Fp: passband edge
%   Fst: stopband edge
%   Ap: passband ripple
%   Ast; stopband attenuation

% obtain the maximum deviation for the passband and stopband ripples in linear units
Rp  = (10^(Ap/20) - 1)/(10^(Ap/20) + 1);
Rst = 10^(-Ast/20);

% minimum order design
Num = firgr('minorder',[0 Fp/(Fs/2) Fst/(Fs/2) 1], [1 1 0 0],[Rp,Rst]);
end