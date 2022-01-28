function y = mov_avg_multi_dim(x, M)

[rows, colums] = size(x);

x = [zeros(M - 1,colums + M - 1);[zeros(rows,M-1), x]];

for m = 1: rows
    sum = zeros(rows,1);
    for n = 1 : colums
        for l = 0 : M - 1
            for k = 0 : M - 1
                sum(n) = sum(n) + x(m - l + M -1 , n - k + M -1);
            end
        end
    y(m, n) = sum(n)/M^2;
    end
end

