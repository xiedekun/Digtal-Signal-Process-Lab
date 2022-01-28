f = 220;  
fs = 2048;
N = 32;
dt = 1/fs;
T = (0 : N-1) * dt;

x = sin(2 * pi *f * T);

FFT = fft(x);

freq_range = [0 : fs / N : fs/2];

stem(freq_range, abs(FFT(1: length(freq_range))));

axis tight;
xlabel('Frequency(Hz)')
ylabel('|X|')
set(gca, 'xtick', freq_range); %设置x轴步长