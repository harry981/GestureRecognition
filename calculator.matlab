stableGesture=0;
if sum(gHis== gesture)== gHisSize&& gesture ~= -1
clc;
stableGesture=1;
expIndex= expIndex+1;
if gesture <=9
exp(expIndex)= num2str(gesture);
disp(exp);
elseif gesture== 10
exp(expIndex)= '+';  
disp(exp);
elseif gesture== 11
exp(expIndex)= '-';
disp(exp);
elseif gesture== 12
exp(expIndex)= 'x';
disp(exp);
elseif gesture== 13
exp(expIndex)= '/';
disp(exp);
else
disp(strcat(exp,'= '));
disp(str2num(exp));
break;

end
gHis= -1*ones(gHisSize,1);
end
