videoObject = VideoReader('face1_final.mp4');
    imageData = read(videoObject);
    numFrames = get(videoObject, 'NumberOfFrames');
       Heig= get(videoObject, 'Height');
       Wid= get(videoObject, 'Width');
       Rateframe= get(videoObject, 'FrameRate');
       time=get(videoObject, 'Duration');

numFrames;
       for i=1:numFrames
        xyloObj = videoObject;
        frame = read(xyloObj,i); % reading the 10th frame
        c = 250; 
        r = 100;
        dd1=impixel(frame, c, r);
        rgb1(i,:,:,:) = dd; 
        size(rgb1);
        size(dd);
%         rgb(i,2) = impixel(frame(i,2), c, r);
%         rgb(i,2) = impixel(frame(i,2), c, r);% returns the RGB value of column 200 and row 100
       end
       
       subplot(2,1,1);
       y=rgb(:,2);
       plot(y);
       xlim([0 numFrames])
       
       subplot(2,1,2);
L=numFrames;
Fs=Rateframe;
       Y = fft(y,L);
       P2 = abs(Y/L);
        P1 = P2(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        f = Fs*(0:(L/2))/L;
plot(f,P1) 
xlim([0.5 1.5])
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')