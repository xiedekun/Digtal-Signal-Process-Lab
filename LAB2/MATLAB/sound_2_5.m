clear all
sndfile = 'speech_female.wav';
[x,Fs] = audioread(sndfile); %read audio files
N = 512; % sample number
[S,F,T] = spectrogram(x(1:Fs*1.4),N,3*N/4,N*4,Fs);  

factor = 20;
x = decimate(x(1:Fs*5), factor);
%stem(0: length(x) - 1, x)
new_Fs = Fs/factor;

sound(x,new_Fs) % play audio