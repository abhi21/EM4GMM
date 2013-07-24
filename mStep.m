function [mu,sigma,pi] = mStep(data,gamma)
% gamma:    n x k
% data:     n x d
% mu:       d x k
% sigma:    array of maximized
% pi:       column vector of probabilities

k = size(gamma, 2);
d = size(data, 2);
n = size(gamma,1);
mu = zeros(d, k);
x = data;
  
nk = sum(gamma,1);
 
%re-estimating pi values
pi = zeros(1, k);
for i = 1 : k
    pi(i) = nk(i) / n;
end

%re-estimating mu values 
for i = 1 : k
    sumn = 0;
    for j = 1 : n
        sumn = sumn + gamma(j, i) * x(j,:);
    end
    sumn = sumn / nk(i);
    mu(:,i) = sumn(:);
end
  
%re-estimating sigma values
sigma = cell(1,k);
for i = 1 : k
    sumn = 0;
    for j = 1 : n
        t = x(j,:)-mu(:, i)';
        sumn = sumn + gamma(j, i) * (t' * t);
    end
    sumn = sumn / nk(i);
    sigma{i} = sumn;
end