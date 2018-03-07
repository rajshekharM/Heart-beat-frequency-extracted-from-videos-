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
        dd2=impixel(frame, c-2, r-2);
        dd3=impixel(frame, c+2, r-2);
        dd4=impixel(frame, c-2, r+2);
        dd5=impixel(frame, c+2, r+2);
        rgb1(i,:,:,:) = dd1;
        rgb2(i,:,:,:) = dd2;
        rgb3(i,:,:,:) = dd3;
        rgb4(i,:,:,:) = dd4;
        rgb5(i,:,:,:) = dd5;
        size(rgb1);
        size(dd1);
%         rgb(i,2) = impixel(frame(i,2), c, r);
%         rgb(i,2) = impixel(frame(i,2), c, r);% returns the RGB value of column 200 and row 100
       end
              
       subplot(2,1,1);
       y1=rgb1(:,2);
       y2=rgb2(:,2);
       y3=rgb3(:,2);
       y4=rgb4(:,2);
       y5=rgb5(:,2);
       
       plot(y1);
       hold on
       grid on
       xlim([0 numFrames])
       plot(y2,'s-m','MarkerSize',6);

       
       
       subplot(2,1,2);
L=numFrames;
Fs=Rateframe;
       Y = fft(y1);
       P2 = abs(Y/L);
        P1 = P2(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        f = Fs*(0:(L/2))/L;
plot(f,P1)
hold on
       Y = fft(y2);
       P2 = abs(Y/L);
        P1 = P2(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        f = Fs*(0:(L/2))/L;
plot(f,P1)
grid on
plot(y2,'s-m','MarkerSize',6);
xlim([0 1.5])
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')