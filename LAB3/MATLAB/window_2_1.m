N = 32;
N_tri = 31;

rectangular(1:N) = 1;

triangular = zeros(1,N_tri);
for n = 0 : N_tri -1    
    triangular(n+1) = ((N_tri-1)/2 - abs(n-(N_tri-1)/2))*2/(N_tri-1);
end

 sine = sin(pi * [0:N-1] / (N-1));


Hann = zeros(1,N);
for n = 0 : N-1  
    Hann(n+1) = 1/2 * (1-cos(2 * pi * n/(N-1)));
end

plot(0: N-1, rectangular,'black');
hold on;
plot(0:N_tri-1, triangular,'blue');
hold on;
plot(0: N-1, sine,'green');
hold on;
plot(0: N-1, Hann,'red');

axis tight;
xlabel('N')
ylabel('Amplitude')
ylim([0,1.5]);

gtext('rectangular window','Color','black');
gtext('triangular window','Color','blue');
gtext('sine window','Color','green');
gtext('Hann window','Color','red');