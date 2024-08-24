fun = @(x) exp(-x) + sin(2*x + pi/3);

[x1,iter]=bisekcja(fun,0,2,0.01)

iter=8;
przedzial=0:4;



function [x1, iter] = bisekcja(fun, a, b, eps)
    iter = 1;
    while (b - a) / 2 > eps
        iter = iter + 1;
        x1 = (a + b) / 2;
        if fun(x1) == 0
            break;
        elseif fun(a) * fun(x1) < 0
            b = x1;
        else
            a = x1;
        end
    end
    x1 = (a + b) / 2;
end
