m = 500;
n = 40;

A = rand(m, n);
B = rand(m, n);
x = rand(m, 1);
y = rand(n, 1);

%1
D1 = diag(x);
D2 = diag(y);

had11 = (D1.')*(A.*B)*(D2);
had12 = (D1*A).*(B*D2);
had13 = (D1*A*D2).*B;
had14 = (A*D2).*(D1*B);
had15 = A.*(D1*B*D2);
error1 = norm(had11-had12) + norm(had11-had13) + norm(had11-had14) + norm(had11 - had15)

%2
had21 = x * ones(m, 1).' .* eye(m);
error2 = norm(D1 - had21)

%3
had31 = x.' * (A.*B) * y;
had32 = trace( D1 * A * D2 * B.');
error3 = norm(had31-had32)


