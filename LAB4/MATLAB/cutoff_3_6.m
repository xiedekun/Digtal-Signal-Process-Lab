alpha = -0.15;
b = [alpha, 1];
a = [1, alpha];
N = 1024;

h0 = freqz(b,a,N,'whole');
h1 = freqz([1,1],[1,1],N,'whole');
h = h0 + h1;

mag = 20 * log10( abs(h)./max(abs(h)));

plot((0:N/2)/N, mag(1:N/2+1))
xlabel('Normalized Frequency')
ylabel('Magnitude')

hold on 
c((1:N/2+1)) = -3;
plot((0:N/2)/N, c)
gtext('-3dB')
