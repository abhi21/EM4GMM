function gamma = eStep(data,pi,mu,sigma)
% gamma:    n x k
% data:     n x d
% mu:       d x k
% sigma:    array of covariance matrices (d x d)
% pi:       column vector of probabilities

n = size(data, 1);
k = size(mu, 2);
gamma = zeros(n, k);
x = data;
 
for i = 1 : n
    for j = 1 : k
        denom=0;
        for p = 1 : k
            denom = denom + pi(p) * mvnpdf(x(i,:), mu(:, p)', sigma{p});
        end
        gamma(i, j) = pi(j) * mvnpdf(x(i,:), mu(:, j)', sigma{j}) / denom;
    end
end