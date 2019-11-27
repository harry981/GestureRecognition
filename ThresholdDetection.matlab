clear;
clc;
%% video object %%
vid = videoinput('winvideo', 1,'MJPG_320x240');
flushdata(vid);
src = getselectedsource(vid);
vid.ReturnedColorspace = 'rgb';

preview(vid);
pause();
im= imcrop(getsnapshot(vid));
ycbcr=rgb2ycbcr(im);
cb=ycbcr(:,:,2);
cr=ycbcr(:,:,3);
cbMean= mean(cb(:));
crMean= mean(cr(:));
cbWin= 10;
crWin= 5;
%     cbLow= cbMean- cbWin
%     cbHigh= cbMean+ cbWin
%     crLow= crMean- crWin
%     crHigh= crMean+ crWin
cbLow= min(cb(:));
cbHigh= max(cb(:));
crLow= min(cr(:));
crHigh= max(cr(:));
stoppreview(vid);
threshold= [cbLowcbHighcrLowcrHigh];
save('cbcrValues','threshold');
closeallforce;
imhist(cb);
title('cb Histogram');
figure, imhist(cr);
title('cr Histogram');
pause();
closeall;
clear;

