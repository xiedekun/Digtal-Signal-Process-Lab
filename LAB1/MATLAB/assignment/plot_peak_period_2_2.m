[data, count] = readbuoydata('C:\MisterDK\Queen Mary University of London\Courses\Digital Signal Processing\LAB ASSESSMENTS\LAB1\images\045200603.txt');
hs = data.Hs;
tp = data.Tp;
date = data.date;

t = tiledlayout(2,1); %构建布局
ax1 = nexttile;
plot(date, hs);
ylabel("Significant Wave Height (m)");

ax2 = nexttile;
plot(date, tp);
ylabel("Peak Period (s)");
xlabel(ax2,'Time');

dateformat = 'mm-dd';
linkaxes([ax1,ax2], 'x'); %同步两个x轴对齐

xticklabels(ax1,{}); %清空第一个x轴
t.TileSpacing = 'compact'; % 两个图更紧凑

datetick('x', dateformat,'keepticks');







