M = [5, 21, 51];
N = 1024;
for m = M
    ir = ones(1,m) ./m;
    g = grpdelay(ir, 1, 1024, 'whole');
    hold on
    plot([0:N/2]/N, g(1:N/2+1));
    gtext(num2str(m))
end
axis tight;
xlabel('Normalized Frequency')
ylabel('Group Delay (Sample)')
set (gca, 'YLim', [0 30])
