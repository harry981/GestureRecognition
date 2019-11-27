if initialize== 1
hide(vSkinbw);
hide(vMedfil);
hide(vErodefil);
hide(vDilatefil);
if sum(sum(imHand))> 0.5* roiRect(3)*roiRect(4)
gesture= predictGesture(all_theta,imHand);
else
gesture= -1;
end
showCalInputImage;

     %% calculator %%
calculator;


end


%Gesture Prediction function
function p= predictGesture(all_theta,imHand)
scale= 50;
stats= regionprops(bwlabel(imHand),'Area','Boundingbox');
    j= find([stats.Area]== max([stats.Area]));
req_im=imresize(imcrop(imHand, stats(j).BoundingBox),[scale scale]);
%imshow(req_im);
    X= req_im(:)';
    X= [1 X];
htheta = sigmoid(X * all_theta');
    [confidence, p] = max(htheta, [], 2);

if confidence< 0.8
        p= -1;
else
confidence;
        p= p-1;
end
end
