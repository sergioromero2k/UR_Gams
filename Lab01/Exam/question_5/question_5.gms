Variable z;
Free Variable x1;
Positive Variables x2, x3, x4, x5;

Equations sol, rest1, rest2, rest3;
    sol..       z =e= -2*x1 + 4*x2 + 7*x3 + x4 + 5*x5;
    rest1..     -x1 + x2 + 2*x3 + x4 + 2*x5 =e= 7;
    rest2..     -x1 + 2*x2 + 3*x3 + x4 + x5 =e= 6;
    rest3..     -x1 + x2 + x3 + 2*x4 + x5 =e= 4;

Model question_5 /all/;
Solve question_5 using lp minimizing z;