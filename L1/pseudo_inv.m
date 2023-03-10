% case 1

r1 = 500;
A1 = randn(r1, r1);
x1 = randn(r1, 1);
b1 = A1*x1;
A_inv1 = inv(A1);
x1_ = A_inv1 * b1;
case_1 = norm(x1 - x1_)

n1 = normrnd(0, 0.2, size(b1)); % noise
y1 = A1 * x1 + n1; % b+n
x1_ = A_inv1 * y1;

case_1_noise = norm(x - x_) 

% case 2
m2 = 50;
n2 = 50;
r2 = m2;
u2 = orth(randn(m2, r2));
v2 = orth(randn(n2, r2)).';
A2 = u2*v2;
check_r2 = rank(A2)

x2 = randn(n2, 1);
b2 = A2*x2;
x2_ = A2.'*inv(A2*A2.')*b2;

case_2 = norm(x2-x2_)

% case 3

m3 = 8;
n3 = 6;
r3 = n3;
u3 = orth(randn(m3, r3));
v3 = orth(randn(n3, r3)).';
A3 = u3*v3;
check_r3 = rank(A3)
x3 = randn(n3, 1);
b3 = A3*x3;
x3_ = inv(A3.'*A3)*A3.'*b3;
case_3 = norm(x3 - x3_)

% case 1 svd
[u1, s1, v1] = svd(A1);
A1_inv_svd = v1 * diag(1./diag(s1)) * u1.';

x1_svd = A1_inv_svd * b1;

case_1_svd = norm(A1_inv_svd - pinv(A1))
norm(x1_svd - x1)

% case 2 svd

[u2, s2, v2] = svd(A2);
% A2A2T_inv_svd = v2 * diag(1./diag(s2)) * u2.';

A2_inv_svd = v2 * s2.' * diag(1./diag(s2*s2.')) * u2.'

case2_svd = norm(A2_inv_svd - pinv(A2))

x2_svd = A2.' * A2A2T_inv_svd * b2;
norm(x2_svd - x2)

% case 3 svd

% [u3, s3, v3] = svd(A3.'*A3);
[u3, s3, v3] = svd(A3);
% A3TA3_inv_svd = v3 * diag(1./diag(s3))*u3.';
% s3_inv = zeros(n3, m3);
% s3_inv(1:size(diag(s3)), 1:size(diag(s3))) = diag(1./diag(s3));
A3_inv_svd = v3 * diag(1./diag(s3.'*s3)) * s3.' * u3.'

case3_svd = norm(A3_inv_svd - pinv(A3))

x3_svd = A3TA3_inv_svd * A3.' * b3;
norm(x3_svd-x3)

