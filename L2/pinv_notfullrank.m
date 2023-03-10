m = 10;
n = 12;
r = 5;

x = randn(n, 1);
A = generate_mat(m, n, r);
b = A * x;

A_dd = A_double_dagger(A);

x_pinv = pinv(A) * b;
% norm(pinv(A)-A_dd)

x_ = A_dd * b;

error = norm(x-x_)
pinv_error = norm(x-x_pinv)

disp = zeros(n, 3);
disp(:, 1) = x;
disp(:, 2) = x_;
disp(:, 3) = x_pinv;
disp

function A_dd = A_double_dagger(A)
    [U, S, V] = svd(A);
    r = rank(A);
    S1 = S(1:r, 1:r);
    S1_inv = diag(1./diag(S1)); % r x r
    V_ = V(:, 1:r); % n x r
    U_ = U(:, 1:r); % m x r
    A_dd = V_ * S1_inv * U_.';
    
end

function A = generate_mat(m, n, r)
    P = diag([randn(1, r), zeros(1, m-r)]);
    Q = randn(m, n);
    R = diag([randn(1, r), zeros(1, n-r)]);
    A = P*Q*R;
end

