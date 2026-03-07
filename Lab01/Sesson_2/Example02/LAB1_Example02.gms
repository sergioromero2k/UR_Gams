Sets
    i   variables / 1, 2 /
    j   restriction / Rest1, Rest2, Rest3 /
;

Parameters
    prices(i)
    /   1   24
        2   18
    /
    
    resources(j)
    /
        Rest1   12
        Rest2   10
        Rest3   8
    /
;

Table
    matrix_tecnol(i,j)
            Rest1   Rest2   Rest3
        1   3       3       4   
        2   4       3       2
;

Free Variables z;
Positive Variable x(i);

Equations
    benefit
    lim_resources(j)
;

benefit..               z =e= sum(i, prices(i)*x(i));
lim_resources(j)..      sum(i, matrix_tecnol(i,j)*x(i)) =l= resources(j);
;

Model Example02 /all/;
Solve Example02 using lp maximizing z;

Display
    z.l;