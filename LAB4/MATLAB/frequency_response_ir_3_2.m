b = [0.206572, 0.413144, 0.206572];
a = [1 , -0.369527, 0.195816];
N = 1024;
h = freqz(b,a,N,"whole");
mag = 20 * log10( abs(h)./max(abs(h)));

subplot(3,1,1)
plot((0:N-1)/N, mag)
xlabel('Normalized Frequency')
ylabel('Magnitude (dB)')

subplot(3,1,2)
phase = unwrap(angle(h));
plot((0:N-1)/N, phase)
xlabel('Normalized Frequency')
ylabel('Phase')

subplot(3,1,3)
g = grpdelay(b, a, N, 'whole');  
plot((0:N-1)/N, g)
xlabel('Normalized Frequency')
ylabel('Group Delay (Sample)')