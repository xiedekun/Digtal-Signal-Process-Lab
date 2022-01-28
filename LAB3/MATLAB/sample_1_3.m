f1 = 128;
f2 = 220;
f3 = 525;
fs = 2048;
dt = 1/fs;
N = 32;
M = 2048;
T = (0 : N-1) * dt;

x = sin(2* pi * f1 * T) + 0.2*sin(2 * pi * f2 * T) + 0.01 * cos(2 * pi * f3 * T);

plot(0:N-1,x)
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