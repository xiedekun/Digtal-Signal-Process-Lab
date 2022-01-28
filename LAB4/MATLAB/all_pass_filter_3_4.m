alpha = -0.9;
b = [alpha, 1];
a = [1, alpha];
N = 1024;

h = freqz(b,a,N,'whole');

subplot(3,1,1)
plot((0:N/2)/N, abs(h(1:N/2+1)))
xlabel('Normalized Frequency')
ylabel('Magnitude')

subplot(3,1,2)
phase = unwrap(angle(h));
plot((0:N/2)/N, phase(1:N/2+1))
xlabel('Normalized Frequency')
ylabel('Phase')

subplot(3,1,3)
g = grpdelay(b, a, N, 'whole');  
plot((0:N/2)/N, g(1:N/2+1))
xlabel('Normalized Frequency')
ylabel('Group Delay (Sample)')