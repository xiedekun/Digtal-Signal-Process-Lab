f1 = 128;
f2 = 220;
f3 = 525;
fs = 2048;
dt = 1/fs;
N = 32;
N_tri = N -1;
T = (0 : N-1) * dt;
M = 2048;

x = sin(2* pi * f1 * T) + 0.2*sin(2 * pi * f2 * T) + 0.01 * cos(2 * pi * f3 * T);

rectangular(1:N) = 1; %rectangular window

triangular = zeros(1,N_tri);%triangular window
for n = 0 : N_tri -1    
    triangular(n+1) = ((N_tri-1)/2 - abs(n-(N_tri-1)/2))*2/(N_tri-1);
end
triangular = [triangular 0];

sine = zeros(1,N); %sine window
for n = 0 : N-1  
    sine(n+1) = sin(pi * n / (N-1));
end

Hann = zeros(1,N); %Hann window
for n = 0 : N-1  
    Hann(n+1) = 1/2 * (1-cos(2 * pi * n/(N-1)));
end

y_rec = fft(x .* rectangular, M);
y_tri = fft(x .* triangular, M);
y_sine = fft(x .* sine, M);
y_Hann = fft(x .* Hann, M);

mag_rec = 20*log10(abs(y_rec(1: (M/2 + 1)))/max(abs(y_rec(1: (M/2 + 1)))));
mag_tri = 20*log10(abs(y_tri(1: (M/2 + 1)))/max(abs(y_tri(1: (M/2 + 1)))));
mag_sine = 20*log10(abs(y_sine(1: (M/2 + 1)))/max(abs(y_sine(1: (M/2 + 1)))));
mag_Hann = 20*log10(abs(y_Hann(1: (M/2 + 1)))/max(abs(y_Hann(1: (M/2 + 1)))));

t = tiledlayout(2,2);
ax1 = nexttile();
plot([0: M/2]*fs/M, mag_rec);
title('Rectangular');
axis tight;
xticks([0 128 220 525 1024]);

ax2 = nexttile();
plot([0: M/2]*fs/M, mag_tri);
title('Triangular');
axis tight;
xticks([0 128 220 525 1024]);

ax3 = nexttile();
plot([0: M/2]*fs/M, mag_sine);
xlabel(ax3,'Frequency(Hz)');
title('Sine');
axis tight;
xticks([0 128 220 525 1024]);

ax4 = nexttile();
plot([0: M/2]*fs/M, mag_Hann);
xlabel(ax4,'Frequency(Hz)');
title('Hann');
axis tight;
xticks([0 128 220 525 1024]);