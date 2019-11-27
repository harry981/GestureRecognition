imSkin= findSkin(img, threshold);
step(vSkinbw, imSkin);

imSkin= medfilt2(imSkin, [medfilSizemedfilSize]);
step(vMedfil, imSkin);

seErode= strel('disk',erodeSize);
imSkin= imerode(imSkin, seErode);
step(vErodefil, imSkin);

seDilate= strel('disk',dilateSize);
imSkin= imdilate(imSkin, seDilate);
step(vDilatefil, imSkin);

imHand= imcrop(imSkin, roiRect);
step(vGesture,imHand);

img= step(box,img,roiRect); 
step(vVideo, img);

