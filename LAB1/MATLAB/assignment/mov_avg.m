function y = mov_avg(x, M)

size = length(x);

x = [zeros(1,M - 1), x];

for n = 1  : size
    sum = 0;
    for k = 0 : M - 1
        sum = sum + x(n + M - 1 - k);
    end
    y(n) = sum/M;
end

%n = length(x);
%x = [zeros(1,M), x];
%for j = 1:n
%y(j) = sum(x(j: j+M -1))/M;
%end

