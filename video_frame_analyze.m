videoObject = VideoReader('face1_final.mp4');
    imageData = read(videoObject);
    numFrames = get(videoObject, 'NumberOfFrames');
       Heig= get(videoObject, 'Height');
       Wid= get(videoObject, 'Width');
       Rateframe= get(videoObject, 'FrameRate');
       time=get(videoObject, 'Duration');
       
       i=10;
               frame = read(videoObject,i);
               imshow(frame)% reading the 10th frame
imtool(frame)