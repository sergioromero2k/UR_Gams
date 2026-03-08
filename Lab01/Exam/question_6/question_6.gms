Variable z;
Variables x1, x2, x3;

Equations sol, rest1, rest2, rest3;
    sol..       z =e= 4*x1 + 8*x2 - 6*x3;
    rest1..     3*x1 + x2 =l= 12;
    rest2..     3*x1 + x3 =e= 5;
    rest3..     4*x1 + 2*x2 =e= 10;

Model beneficio_maximo /all/;
Solve beneficio_maximo using lp maximizing z;