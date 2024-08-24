xx = [-2,-1,0,1,2];
yy = [4,1,0,1,4];

%kwadratowy
m = Aproksymacja(xx,yy,2)


x = [-3 ,  -2,    -1,     0 ,    1,     2,     3];
y = [-13.5092,   15.0143,   15.6399,   11.9732,    2.1204,    7.1199,   22.1617];

%stopnia trzeciego
m3 = Aproksymacja(x,y,3)


function [m] = Aproksymacja(x, y, stopien)
    G = ones(length(x), stopien+1);
    d = y';
    for i=1:size(G,1)
        for j=1:size(G,2)
            G(i,j) = x(i)^(j-1);
        end
    end
    m = inv(G' * G) * G' * d;
end

