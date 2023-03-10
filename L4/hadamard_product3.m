m = 5;
n = 4;

%1 upper
A = rand(m, n);
B = rand(m, n);
U1 = triu(A);
U2 = triu(B);
had1 = U1.*U2;
error1 = norm(had1 - triu(had1))

%2 lower
L1 = tril(A);
L2 = tril(B);
had2 = L1.*L2;
error2 = norm(had2 - tril(had2))

%3 p(s)d
psd1 = A'*A;
psd2 = B'*B;
had3 = psd1.*psd2;
error3 = norm(had3'*had3 - had3*had3')

%4 unitary
[Un1, ~, ~] = svd(rand(m));
[Un2, ~, ~] = svd(rand(m));
had4 = Un1.*Un2;
error4 = rank(had4) - sum(diag(had4'*had4))

%5 sym
temp = rand(m);
S1 = temp + temp.';
temp = rand(m);
S2 = temp + temp.';
had5 = S1.*S2;
error5 = norm(had5 - had5.')

%6 normal



function [M, l] = generate_mat(n)
   l = randi(10, n, 1);
   % l(0) = 0;
   [M1, ~, ~] = svd(rand(n));
   M = M1 * diag(l) * M1.';
end







