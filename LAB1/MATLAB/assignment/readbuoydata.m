function [data, count] = readbuoydata(datafile)

fid = fopen(datafile, 'r');
tline = fgetl(fid);
tline = fgetl(fid);

[A, count] = fscanf(fid, '%d %d %d %d %d %f %f %d %f %f', [10 inf]);

data.date = datenum([A(1:5,:); zeros(1, size(A,2))]')';
data.Hs = A(6, :); % significant wave height
data.Tp = A(7, :); % peak period
data.Dp = A(9, :); % peak period direction
data.Ta = A(9, :); % average period
data.SST = A(10, :); % sea surface temperature

fclose(fid);