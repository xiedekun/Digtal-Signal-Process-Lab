fundamental = 200;
number_partials = 10;
duration = 3;
Fs = 44100;
T = 1 / Fs;
t  = [0: T : duration - T];

signal = zeros(1, duration*Fs);

ampenv = zeros(1, duration * Fs);
attack_duration = 1;
release_duration = 1;
ampenv = [linspace(0, 1, attack_duration*Fs) ...
                ones(1, (duration - attack_duration - ...
                release_duration) * Fs) ...
                linspace(1, 0, release_duration * Fs)];
plot(t, ampenv);

for i = 1: number_partials
    signal = signal + ampenv .* sin(2*pi*fundamental*i*t);
end
soundsc(signal, Fs);

%保证信号中没有大于1的值
if (max(signal) > 1.0)
    signal = signal / (max(signal) + 0.1);
end
audiowrite('test.wav', signal, Fs);