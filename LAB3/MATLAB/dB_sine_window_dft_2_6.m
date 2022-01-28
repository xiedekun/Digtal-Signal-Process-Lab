N = 32;
sample_number = 1024;

sine = zeros(1,N);
for n = 0 : N-1  
    sine(n+1) = sin(pi * n / (N-1));
end

Hann = zeros(1,N);
for n = 0 : N-1  
    Hann(n+1) = 1/2 * (1-cos(2 * pi * n/(N-1)));
end

y_sine = abs(fftshift(fft(sine,sample_number)));
y_Hann = abs(fftshift(fft(Hann,sample_number)));

mag_sine = 20*log10(y_sine / max(y_sine));
mag_Hann = 20*log10(y_Hann / max(y_Hann));

plot((-sample_number/2:sample_number/2 - 1)/sample_number, mag_sine,'red');

hold on;
plot((-sample_number/2:sample_number/2 - 1)/sample_number, mag_Hann,'black:');

legend('Sine','Hann')
xlabel('Normalized Frequency');
ylabel('Magnitude(dB)')
axis([-0.2,0.2,-80,5])

%hold on; %calculate lobe width
%z((1:sample_number)) = -3;
%plot((-sample_number/2:sample_number/2 - 1)/sample_number, z,'blue');
%gtext('Y=-3 dB')

