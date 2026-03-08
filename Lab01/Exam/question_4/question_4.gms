Free Variables z;
Positive Variables x1, x2, x3;

Equations sol, rest1, rest2, rest3;
    sol..       z =e= 3*x1 + x2 + 3*x3;
    rest1..     2*x1 + x2 + x3 =l= 2;
    rest2..     x1 + 2*x2 + 3*x3 =l= 5;
    rest3..     2*x1 + 2*x2 + x3 =l= 6;
;

Model question_4 /all/;
Solve question_4 using lp maximizing z;
