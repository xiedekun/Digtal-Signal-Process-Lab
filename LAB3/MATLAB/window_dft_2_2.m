N = 32;
N_tri = 31;
sample_number = 1024;

rectangular(1:N) = 1;

triangular = zeros(1,N_tri);
for n = 0 : N_tri -1    
    triangular(n+1) = ((N_tri-1)/2 - abs(n-(N_tri-1)/2))*2/(N_tri-1);
end

sine = zeros(1,N);
for n = 0 : N-1  
    sine(n+1) = sin(pi * n / (N-1));
end

Hann = zeros(1,N);
for n = 0 : N-1  
    Hann(n+1) = 1/2 * (1-cos(2 * pi * n/(N-1)));
end

y_rec = fftshift(fft(rectangular,sample_number));
y_tri = fftshift(fft(triangular,sample_number));
y_sine = fftshift(fft(sine,sample_number));
y_Hann = fftshift(fft(Hann,sample_number));

t = tiledlayout(2,2);
ax1 = nexttile;
plot((-sample_number/2:sample_number/2 - 1)/sample_number, abs(y_rec),'black');
title('Rectangular')

ax2 = nexttile;
plot((-sample_number/2:sample_number/2 - 1)/sample_number, abs(y_tri),'blue');
title('Triangular')

ax3 = nexttile;
plot((-sample_number/2:sample_number/2 - 1)/sample_number, abs(y_sine),'green');
title('Sine')

ax4 = nexttile;
plot((-sample_number/2:sample_number/2 - 1)/sample_number, abs(y_Hann),'red');
title('Hann')

xlabel(ax3,'f')
xlabel(ax4,'f')

