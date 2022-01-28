function y = mov_avg_noncausual_m(x, M)

size = length(x);

x = [zeros(1,(M - 1)/2), x, zeros(1,(M - 1)/2)];

for n = 1 : size
    sum = 0;
    for k = -(M-1)/2 : (M-1)/2
        sum = sum + x(n + (M - 1)/2 - k);
    end
    y(n) = sum/M;
end