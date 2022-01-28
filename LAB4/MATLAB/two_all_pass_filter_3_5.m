alpha = -0.15;
b = [alpha, 1];
a = [1, alpha];
N = 1024;

h0 = freqz(b,a,N,'whole');
h1 = freqz([1,1],[1,1],N,'whole');
h = h0 + h1;

mag = 20 * log10( abs(h)./max(abs(h)));

subplot(3,1,1)
plot((0:N/2)/N, mag(1:N/2+1))
xlabel('Normalized Frequency')
ylabel('Magnitude')

subplot(3,1,2)
phase = unwrap(angle(h));
plot((0:N/2)/N, phase(1:N/2+1))
xlabel('Normalized Frequency')
ylabel('Phase')

subplot(3,1,3)
g1 = grpdelay(b,a, N, 'whole');  
g2 = grpdelay([1,1],[1,1], N, 'whole');  
g = g1+g2;
plot((0:N/2)/N, g(1:N/2+1))
xlabel('Normalized Frequency')
ylabel('Group Delay (Sample)')