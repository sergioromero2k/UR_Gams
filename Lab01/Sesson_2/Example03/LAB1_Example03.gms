Set
    i   /1, 2/
    j   /Rest1, Rest2, Rest3/
;

Parameters
    Prices(i)
    /
        1   24
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
    matrix(i,j)
            Rest1   Rest2   Rest3
        1   3       3       4
        2   4       3       2
;

Free Variables z;
Integer Variables x(i);

Equations   benefit, restriction(j);

benefit..               z =e= sum(i, x(i)*Prices(i));
restriction(j)..        sum(i, matrix(i,j)*x(i)) =l= resources(j);
;

Model example2 /all/;
Solve example2 using mip maximizing z;
