M = [5, 21, 51];
N = 1024;
for m = M
    ir = ones(1,m) ./m;
    dft = fft(ir,N);
    phase = abs(dft(1:N/2+1));unaltered 
    hold on
    plot([0:N/2]/N,mag);
    gtext(num2str(m))
end
axis tight;
xlabel('Normalized Frequency')
ylabel('Magnitude')
