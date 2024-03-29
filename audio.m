[x,fs]=audioread("C:\Users\aa734\OneDrive\Documents\MATLAB\WhatsApp Audio 2023-08-21 at 18.20.37.mp3");
N=length(x);
t=fft(x,N);
X=fftshift(t);

f=-fs/2:fs/N:(fs/2-fs/N);
figure(1)
plot(f,abs(X))
title('original audio signal')
Xr=zeros(1,N);

%%FORMULA
Xr((N*((50/100)/2))+1 : N*(1-(50/100)/2)) = X((N*((50/100)/2))+1 :  N*(1-(50/100)/2));
%Xr((N*((60/100)/2))+1 : N*(1-(60/100)/2)) = X((N*((60/100)/2))+1 :  N*(1-(60/100)/2));
%Xr((N*((70/100)/2))+1 : N*(1-(70/100)/2)) = X((N*((70/100)/2))+1 :  N*(1-(70/100)/2));
%Xr((N*((90/100)/2))+1 : N*(1-(90/100)/2)) = X((N*((90/100)/2))+1 :  N*(1-(90/100)/2));

figure(2)
plot(f, abs((Xr)));
xr= real(ifft(fftshift(Xr))); %%reconstruction
title('70% compressed audio')
xlabel('freq(hq)');ylabel('magnitude');
% Play the original and compressed audio signals
sound(x, fs);
pause(5); % Wait for the original sound to finish
sound(xr, fs);
%Xr((N*((50/100)/2))+1 : N*(1-(50/100)/2)) = X((N*((50/100)/2))+1 :  N*(1-(50/100)/2));
%Xr((N*((60/100)/2))+1 : N*(1-(60/100)/2)) = X((N*((60/100)/2))+1 :  N*(1-(60/100)/2));
%Xr((N*((90/100)/2))+1 : N*(1-(90/100)/2)) = X((N*((90/100)/2))+1 :  N*(1-(90/100)/2));