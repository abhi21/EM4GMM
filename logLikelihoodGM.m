function ll = logLikelihoodGM(data,mu,sigma,pi)

% data   : each row is a d dimensional data point
% mu     : a d x k dimensional matrix with columns as the means of
% each cluster
% sigma  : a cell array of the cluster covariance matrices
% pi     : a column matrix of probabilities for each cluster
% ll    : the log likelihood of the data (scalar)
 
s = 0;
n = size(data, 1);
k = size(mu, 2);
x = data;
 
for i = 1 : n
    temp = 0;
    for j = 1 : k
        temp = temp + pi(j) * mvnpdf(x(i,:), mu(:, j)', sigma{j});
    end
    s = s + log(temp);
end
 
ll = s;