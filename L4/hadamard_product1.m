m = 5;
n = 6;

% 1
A = rand(m, n);
B = rand(m, n);
AB = A.*B;
BA = B.*A;
error1 = norm(AB-BA)

% 2
C = rand(m, n);
A_BC = A.*(B.*C); % A had(B had C)
AB_C = (A.*B).*C; % (A had B) had C
error2 = norm(A_BC-AB_C)

% 3
D = rand(m, n);
had31 = (A+B).*(C+D);
had32 = (A.*C) + (A.*D) + (B.*C) + (B.*D);
error3 = norm(had31-had32)

% 4
had41 = (A.*B).';
had42 = (A.').*(B.');
error4 = norm(had41-had42)

% 5
works = "True";
for i = 1:10000
    A1 = generate_mat(m, n, randperm(min(m, n), 1));
    A2 = generate_mat(m, n, randperm(min(m, n), 1));
    if rank(A1.*A2) > rank(A1)*rank(A2)
        works = "False";
    end
end
works  

function A = generate_mat(m, n, r)
    P = diag([randn(1, r), zeros(1, m-r)]);
    Q = randn(m, n);
    R = diag([randn(1, r), zeros(1, n-r)]);
    A = P*Q*R;
end

