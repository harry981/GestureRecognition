clear ;
closeall;
clc;
path='E:\Matlab Workspace\GestureRecognition\mosaic15_lr';
input_layer_size  = 2500;  
num_labels = 15;
load('dataset');

fprintf('\nTraining...\n')

lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);
save(fullfile(path,'theta'),'all_theta');

fprintf('Press enter to continue.\n');
pause;
pred = predictOneVsAll(all_theta, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred-1 == y)) * 100);

