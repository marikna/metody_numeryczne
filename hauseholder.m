A = [-1 -1 1;  1 3 3; -1 -1 5; 1 3 7];
[Q, R] = qr_ht(A)


function [Q, R] = qr_ht(A)
[m, n] = size(A);
R = A;
Q = eye(m);

    for k = 1:min(m-1, n)
    % 1. Wybór macierzy Ak
    Ak = R(k:m, k:end);

    % 2. Wybór wektora ak i obliczenie jego normy
    ak = Ak(:, 1);
    norm_ak = norm(ak);

    % 3. Obliczenie wektora vk
    vk = ak;
    vk(1) = vk(1) + sign(ak(1)) * norm_ak;

    % 4. Konstrukcja macierzy Hk
    Hk = eye(m);
    Hk(k:end, k:end) = eye(m-k+1) - 2 * (vk * vk') / (vk' * vk);

    % 5. Częściowa konstrukcja macierzy R
    R = Hk * R;

    % 6. Częściowa konstrukcja macierzy Q
    Q = Q * Hk;
    end
end