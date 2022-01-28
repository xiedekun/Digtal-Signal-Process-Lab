f1 = 128;
f2 = 220;
f3 = 525;
fs = 2048;
dt = 1/fs;
N = 32;
N_tri = 31;
T = (0 : N-1) * dt;

x = sin(2* pi * f1 * T) + 0.2*sin(2 * pi * f2 * T) + 0.01 * cos(2 * pi * f3 * T);

rectangular(1:N) = 1; %rectangular window

triangular = zeros(1,N_tri);%triangular window
for n = 0 : N_tri -1    
    triangular(n+1) = ((N_tri-1)/2 - abs(n-(N_tri-1)/2))*2/(N_tri-1);
end
triangular = [triangular 0];%padding zeron to 32 samples

sine = zeros(1,N); %sine window
for n = 0 : N-1  
    sine(n+1) = sin(pi * n / (N-1));
end

Hann = zeros(1,N); %Hann window
for n = 0 : N-1  
    Hann(n+1) = 1/2 * (1-cos(2 * pi * n/(N-1)));
end

y_rec = fft(x .* rectangular);
y_tri = fft(x .* triangular);
y_sine = fft(x .* sine);
y_Hann = fft(x .* Hann);

mag_rec = abs(y_rec(1: (N/2 + 1)))/max(abs(y_rec(1: (N/2 + 1))));
mag_tri = abs(y_tri(1: (N/2 + 1)))/max(abs(y_tri(1: (N/2 + 1))));
mag_sine = abs(y_sine(1: (N/2 + 1)))/max(abs(y_sine(1: (N/2 + 1))));
mag_Hann = abs(y_Hann(1: (N/2 + 1)))/max(abs(y_Hann(1: (N/2 + 1))));

t = tiledlayout(2,2);
ax1 = nexttile();
stem([0: N/2]*fs/N, mag_rec);
title('Rectangular');
axis tight;
xticks([0 128 220 525 1024]);

ax2 = nexttile();
stem([0: N/2]*fs/N, mag_tri);
title('Triangular');
axis tight;
xticks([0 128 220 525 1024]);

ax3 = nexttile();
stem([0: N/2]*fs/N, mag_sine);
xlabel(ax3,'Frequency(Hz)');
title('Sine');
axis tight;
xticks([0 128 220 525 1024]);

ax4 = nexttile();
stem([0: N/2]*fs/N, mag_Hann);
xlabel(ax4,'Frequency(Hz)');
title('Hann');
axis tight;
xticks([0 128 220 525 1024]);