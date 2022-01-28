M = [5, 21, 51];
N = 1024;
for m = M
    ir = ones(1,m) ./m;
    dft = fft(ir,N);
    phase = angle(dft(1:N/2+1))/pi;
    hold on
    plot([0:N/2]/N,phase);
    gtext(num2str(m))
end
axis tight;
xlabel('Normalized Frequency')
ylabel('Phase')
