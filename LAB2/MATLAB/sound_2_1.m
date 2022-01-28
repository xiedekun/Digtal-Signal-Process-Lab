clear all
sndfile = 'speech_female.wav';
[x,Fs] = audioread(sndfile); %read audio files
N = 512; % sample number
[S,F,T] = spectrogram(x(1:Fs*1.4),N,3*N/4,N*4,Fs);  
% generate spectogram parameters in first 1.4 s of the audio
% S:'estimate of the short-term, time-localized frequency content of x.'
% F:'cyclical frequencies'
% T:'time'
f = figure('Position',[500 300 700 500],'MenuBar','none', ...
 'Units','Normalized'); %create figure
set(f,'PaperPosition',[0.25 1.5 8 5]); %set figure
axes('FontSize',14); %axis setting
colormap('jet'); % color setting
imagesc(T,F./1000,20*log10(abs(S))); % show image
axis xy;
set(gca,'YTick',[0:2000:Fs/2]./1000,'YTickLabel',[0:2000:Fs/2]./1000); % set range and step of x y
ylabel('Frequency (kHz)'); % label axis y
xlabel('Time (s)');% label axis x
print(gcf,'-depsc2','p2i1.eps'); % save 'p2il.eps' file

sound(x(1: 0.6*Fs),Fs) % play audio