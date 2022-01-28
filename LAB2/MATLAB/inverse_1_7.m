f = 220;  
fs = 2048;
N = 32;
dt = 1/fs;
T = (0 : N-1) * dt;

x = sin(2 * pi *f * T);

FFT = fft(x);

IFFT = ifft(FFT);

stem(0 : N-1 , IFFT);
xlabel('Sample(N)')
ylabel('Amplitude')
axis tight;