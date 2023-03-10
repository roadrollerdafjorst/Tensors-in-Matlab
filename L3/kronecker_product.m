%A, B, u, lamda

m = 2;
n = 3;

[A, l1] = generate_mat(m);
[B, l2] = generate_mat(n);

K_AB = kron(A, B);

% 1
lk = eig(K_AB);
sort(kron(l1, l2));

sort(lk);

error = norm(sort(kron(l1, l2)) - sort(lk));

% 2
trK = trace(K_AB)
trA = trace(A);
trB = trace(B);
trtr = trA*trB

% 3
detK = det(K_AB)
detA = det(A);
detB = det(B);
detdet = (detA^n)*(detB^m)

% diag mat
D1 = diag(rand(m, 1));
D2 = diag(rand(n, 1));
KD = kron(D1, D2)

% upper
U1 = triu(A);
U2 = triu(B);
KU = kron(U1, U2)
% lower
L1 = tril(A);
L2 = tril(B);
KL = kron(L1, L2)

% unitary
[Un1, ~, ~] = svd(rand(m));
[Un2, ~, ~] = svd(rand(n));
KUn = kron(Un1, Un2);
check1 = trace(KUn * KUn.') - m*n
check2 = trace(KUn.' * KUn) - m*n

% sym
temp = rand(m);
S1 = temp.*temp.';
temp = rand(n);
S2 = temp.*temp.';
KS = kron(S1, S2);
error = norm(KS- KS.')

% normal
N1 = normal_mat(m);
N2 = normal_mat(n);
KN = kron(N1, N2);
checkN = norm(KN.'*KN - KN*KN.')

% psd


function M = normal_mat(n)
   l = rand(n, 1);
   % l(0) = 0;
   [M1, ~, ~] = svd(rand(n));
   M = M1.' * diag(l) * M1;
end

function [M, l] = generate_mat(n)
   l = randi(10, n, 1);
   % l(0) = 0;
   [M1, ~, ~] = svd(rand(n));
   M = M1 * diag(l) * M1.';
end