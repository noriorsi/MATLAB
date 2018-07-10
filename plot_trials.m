fid = fopen('record.txt' );
S = textscan(fid,'%s','delimiter','\n') ;
S = S{1}  ;
fclose(fid) ;
% Get F0 positions 
idxF0i = strfind(S, 'F0');
idxF0i = find(not(cellfun('isempty',idxF0i)));
% Get Yi positions 
idxF1i = strfind(S, 'F1');
idxF1i = find(not(cellfun('isempty',idxF1i)));
F0i = zeros(length(idxF0i),1) ;
F1i = zeros(length(idxF1i),1) ;
for i = 1:length(idxF0i)
    F0i(i,:) = str2double(S{idxF0i(i)}(5:end)) ;
end
for i = 1:length(idxF1i)
    F1i(i,:) = str2double(S{idxF1i(i)}(5:end)) ;
end

figure(1)
subplot(2,2,1)
plot(F0i)
title(0);
ylabel('Volt');
xlabel('Time'); 
grid

subplot(2,2,2)
plot(F1i)
title(1);
ylabel('Volt');
xlabel('Time'); 
grid