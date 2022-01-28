function [signal] = sinefun(freq, amp, phase, dur)

    Fs = 44100;
    T = 1/Fs;
    t = [0: T: dur - T];
    signal = amp * sin(2 * pi * freq * t + phase);
    
