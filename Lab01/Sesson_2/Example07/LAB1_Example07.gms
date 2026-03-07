Variable z;
Negative Variable x1, x2, x3;
Positive Variable x4;

Equations   benefit, rest1, rest2;
    benefit..   z =e= 6*x1 + 5*x2 + 9*x3 + 40*x4;
    rest1..     x1 + x3 + 4*x4 =l= 3;
    rest2..     x2 + x3 + 5*x4 =l= 4;

Model example07 /all/;
Solve example07 using lp maximizing z;