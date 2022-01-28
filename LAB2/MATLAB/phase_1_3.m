f = 128;  
fs = 2048;
N = 32;
dt = 1/fs;
T = (0 : N-1) * dt;

x = sin(2 * pi *f * T);

FFT = fft(x);

freq_range = [0 : fs / N : fs/2];

ang = angle(FFT(1: length(freq_range)))/pi;

stem(freq_range, ang)


ang_128 =  ang(3) % 128HZ phase