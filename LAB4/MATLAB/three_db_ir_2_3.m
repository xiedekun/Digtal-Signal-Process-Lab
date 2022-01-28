H = [0.00506, 0, -0.04194, 0, 0.28848, 0.49679, 0.28848, 0, -0.04194, 0, 0.00506];
N = 1024;

dft = fft(H,N);
mag = 20 * log10( abs(dft)./max(abs(dft)));
plot((0:N/2)/N, mag(1:N/2+1))
xlabel('Normalized Frequency')
ylabel('Magnitude')
hold on 
c((1:N/2+1)) = -3;
plot((0:N/2)/N, c)
gtext('-3dB')
