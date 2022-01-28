H = [0.00506, 0, -0.04194, 0, 0.28848, 0.49679, 0.28848, 0, -0.04194, 0, 0.00506];
N = 1024;

dft = fft(H,N);
mag = 20 * log10( abs(dft)./max(abs(dft)));

subplot(3,1,1)
plot((0:N/2)/N, mag(1:N/2+1))
xlabel('Normalized Frequency')
ylabel('Magnitude (dB)')

subplot(3,1,2)
phase = unwrap(angle(dft));
plot((0:N/2)/N, phase(1:N/2+1))
xlabel('Normalized Frequency')
ylabel('Phase')

subplot(3,1,3)
g = grpdelay(H, 1, 1024, 'whole');  
plot((0:N/2)/N, g(1:N/2+1))
xlabel('Normalized Frequency')
ylabel('Group Delay (Sample)')