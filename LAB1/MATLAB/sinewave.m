duration = 1;
Fs = 44100;
T = 1/Fs;
t = [0: T: duration - T];
signal = 0.25 * sin(2 * pi * 440 * t);
sound(signal , Fs);