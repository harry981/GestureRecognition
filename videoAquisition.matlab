closeallforce
clc;
clear;

%% video object %%
vid = videoinput('winvideo',1,'MJPG_320x240');
flushdata(vid);
src = getselectedsource(vid);
vid.ReturnedColorspace = 'rgb';
preview(vid);
[m,n,~]= size(getsnapshot(vid));
%disp(m),disp(n);

%% initialization %%
loadGestureImages;
initialize= 0;
%f= 0;
gHisSize= 10;
gHis= -1*ones(gHisSize,1);
box=vision.ShapeInserter('Shape','Rectangles','BorderColor',...
'Custom','CustomBorderColor',uint8([255 0 0])); 
vVideo= vision.VideoPlayer('Name','WorkArea','Position',...
    [45 385 410 300]);
vSkinbw= vision.VideoPlayer('Name','SkinMask','Position',...
    [45 0 410 300]);
%[475 385 410 300]);
vMedfil= vision.VideoPlayer('Name','Skin after Median Filtering','Position',...
    [475 0 410 300]);
%[900 385 410 300]);
vErodefil= vision.VideoPlayer('Name','Skin after Erosion','Position',...
    [900 0 410 300]);
vDilatefil= vision.VideoPlayer('Name','Skin after Dilation','Position',...
    [475 385 410 300]);
vGesture= vision.VideoPlayer('Name', 'Gesture','Position',...
    [900 385 410 300]);
vGImage= vision.VideoPlayer('Name','CalculatorInput','Position',...
    [475 385 410 300]);
medfilSize= 11;
erodeSize= 3;
dilateSize= 3;

roiRect= uint8([0.4*n 0.25*m 0.4*n 0.4*n]);
%roiRect= uint8([0 0 0.4*n 0.4*n]);

load('theta');
load('cbcrValues');

