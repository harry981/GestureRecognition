function [all_theta] = oneVsAll(X, y, num_labels, lambda)

m = size(X, 1);
n = size(X, 2);

all_theta = zeros(num_labels, n + 1);
initial_theta=zeros(n + 1,1);

X = [ones(m, 1) X];

options = optimset('GradObj', 'on', 'MaxIter', 50);

for c = 1:num_labels
initial_theta = all_theta(c, :)';
    [all_theta(c,:)] = fmincg (@(t)(lrCostFunction(t, X, (y == c-1), lambda)), initial_theta, options);
end
end

