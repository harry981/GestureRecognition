while 1
%   f= f+1 
img= getsnapshot(vid); 
if sum(sum(im2bw(img)))==0 
%         stoppreview(vid);
%         flushdata(vid);
%         close all force;
%         break;
if ~initialize  
initialize=1;
gImage= im2bw(ones(100,100));
gHisIndex= 0;
expIndex= 0;
pause(1);
else
stoppreview(vid);
flushdata(vid);
closeallforce;
break;
end
end
