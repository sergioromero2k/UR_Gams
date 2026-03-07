Set
    i   /1, 2, 3, 4, 5/
    j   /Rest1, Rest2/
;

Parameters
    Prices(i)
    /
        1   4
        2   7
        3   6
        4   5
        5   4
    /
    resources(j)
    /
        Rest1 112
        Rest2 109
    /
;

Table
        matrix(j, i)
                1   2   3   4   5
        Rest1   5   8   3   2   7
        Rest2   1   8   6   5   4
;

Variable z;
Integer Variables x(i);

Equations solution, rest(j);
    solution..  z =e= sum(i, x(i)*prices(i));
    rest(j)..   sum(i, matrix(j,i)*x(i)) =l= resources(j);
    ;

Model example08 /all/;
Solve example08 using mip maximizing z;


$onText
* Another way...
Free Variables z;
Integer Variables x1, x2, x3, X4, X5;

Equations beneficio, rest1 rest2;
         beneficio..      z =e= 4*X1 + 7*X2 + 6*X3 + 5*X4 + 4*X5;
         rest1..          5*X1 + 8*X2 + 3*X3 + 2*X4 + 7*X5 =l= 112;
         rest2..         X1 + 8*X2 + 6*X3 + 5*X4 + 4*X5 =l= 109;
         ;

Model Lab1_Ejemplo09 /all/;
Solve Lab1_Ejemplo09 using mip maximizing z;
$offText