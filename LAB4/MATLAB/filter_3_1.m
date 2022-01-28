N =16;  
b = [0.206572, 0.413144, 0.206572];  
a = [1 , -0.369527, 0.195816];  
x(1:N) = 0;
x(1) = 1;  
ftr = filter(b,a,x);  
stem((0:N-1),ftr)  
xlabel('Sample Number')  
ylabel('Amplitude')  


