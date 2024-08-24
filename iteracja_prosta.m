A = [6,4,1; 1,-3,-1; 1,-1,-4]
B = [11, -3, -4]'
X0 = [2;0;-2]
eps = 0.1.^(1:10)
%eps = [0.1, 0.01, 0.001, 0.0001, 0.00001, 0.000001, 0.0000001, 0.00000001, 0.000000001, 0.0000000001]

it_prosta(A,B,X0,0.001)

il_iteracji = zeros(size(eps));

for i = 1:length(eps)
    [X, iter, roznica] = it_prosta(A, B, X0, eps(i));
    il_iteracji(i) = iter;
end


function [X, iter, roznica] = it_prosta(A, B, X0, eps)
D = diag(diag(A))
R = A - D
W = -inv(D) * R
Z = inv(D) * B

w1 = max(sum(abs(W),2))
w2 = max(sum(abs(W)))
w3 = sqrt(sum(sum(W.^2,2)))

if w1 >= 1 || w2 >= 1 || w3 >= 1
        disp("wystapil blad w warunku")
else
iter = 0
roznica = 1
X = X0 
while max(abs(roznica) > eps)
    X0 = X
    X = W * X0 + Z
    roznica = X - X0
    iter = iter+1 
end
end
end
