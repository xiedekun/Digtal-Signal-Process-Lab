b = [0.206572, 0.413144, 0.206572];
a = [1 , -0.369527, 0.195816];
N = 1024;
h = freqz(b,a,N,"whole");
mag = 20 * log10( abs(h)./max(abs(h)));

plot((0:N/2)/N, mag(1:N/2+1))
xlabel('Normalized Frequency')
ylabel('Magnitude (dB)')
hold on 
c((1:N/2+1)) = -3;
plot((0:N/2)/N, c)
gtext('-3dB')
