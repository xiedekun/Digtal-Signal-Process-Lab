[data, count] = readbuoydata('C:\MisterDK\Queen Mary University of London\Courses\Digital Signal Processing\LAB ASSESSMENTS\LAB1\images\045200603.txt');
hs = data.Hs;
tp = data.Tp;
date = data.date;

t = tiledlayout(3,1); %构建布局
ax1 = nexttile;
plot(date, tp,'Color',[0.8 0.8 0.8],'LineWidth',2);
hold on;
plot(date, mov_avg_noncausual_m(tp,5));
ylabel("Peak Period (s)");
title('M = 5')

ax2 = nexttile;
plot(date, tp,'Color',[0.8 0.8 0.8],'LineWidth',2);
hold on;
plot(date, mov_avg_noncausual_m(tp,21));
ylabel("Peak Period (s)");
title('M = 21')

ax3 = nexttile;
plot(date, tp,'Color',[0.8 0.8 0.8],'LineWidth',2);
hold on;
plot(date, mov_avg_noncausual_m(tp,51));
ylabel("Peak Period (s)");
xlabel(ax3,'Time');
title('M = 51')

dateformat = 'mm-dd';
linkaxes([ax1,ax2, ax3], 'x'); %同步两个x轴对齐

xticklabels(ax1,{}); %清空第一个x轴
xticklabels(ax2,{}) ;%清空第一个x轴

t.TileSpacing = 'compact'; % 两个图更紧凑

datetick('x', dateformat,'keepticks');







