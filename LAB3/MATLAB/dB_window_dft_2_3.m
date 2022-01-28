N = 32;
N_tri = 31;
sample_number = 1024;

rectangular(1:N) = 1;

triangular = zeros(1,N_tri);
for n = 0 : N_tri -1    
    triangular(n+1) = ((N_tri-1)/2 - abs(n-(N_tri-1)/2))*2/(N_tri-1);
end

y_rec = abs(fftshift(fft(rectangular,sample_number)));
y_tri = abs(fftshift(fft(triangular,sample_number)));

mag_rec = 20*log10(y_rec / max(y_rec));
mag_tri = 20*log10(y_tri / max(y_tri));

plot((-sample_number/2:sample_number/2 - 1)/sample_number, mag_rec,'red');

hold on;
plot((-sample_number/2:sample_number/2 - 1)/sample_number, mag_tri,'black:');

legend('Rectangular','Triangular')
xlabel('Normalized Frequency');
ylabel('Magnitude(dB)')
axis([-0.2,0.2,-80,5])

hold on; %calculate lobe width
z((1:sample_number)) = -3;
plot((-sample_number/2:sample_number/2 - 1)/sample_number, z,'blue');
gtext('Y=-3 dB')

