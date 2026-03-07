Variables z;
Positive Variables x1, x2;

Equations   benefit, restriction1, restriction2, restriction3;

benefit..       z =e= 2*x1 - x2;
restriction1..  (-1)*x1 + x2 =l= 2;
restriction2..  x1 + x2 =l= 4;
restriction3..  5*x1 + 3*x2 =l= 15;
;

Model example05 /all/;
Solve example05 using lp minizing z;
