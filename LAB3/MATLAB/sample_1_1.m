f = 220;
fs = 2048;
dt = 1/fs;
N = 32;
M = 1024;
T = (0 : N-1) * dt;

x = sin(2* pi * f * T);

FFT_32 = fft(x);
magnitude_32 = abs(FFT_32(1: (N/2 + 1)));

x(N+1: M) = 0;
FFT_1024 = fft(x);
magnitude_1024 = abs(FFT_1024(1: (M/2 + 1)));

plot([0: M/2]*fs/M, magnitude_1024);
hold on 
stem([0: N/2]*fs/N, magnitude_32);
axis tight;
xlabel('Frequency(Hz)')
ylabel('|X|')
set(gca, 'xtick', 0: 110: fs/2)