Free Variables z;
Positive Variables x1, x2, x3;

Equations solution, rest1, rest2;
    solution..  z =e= 4*x1 + x2 + x3;
    rest1..     2*x1 + x2 + 2*x3 =e= 4;
    rest2..     3*x1 + 3*x2 + x3 =e= 3;
;

Model question_3 /all/;
Solve question_3 using lp minimizing z;
    