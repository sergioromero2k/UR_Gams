Variables z;
Positive Variables x1,x2,x3;

Equations
benefit
restriction_1
restriction_2
;

benefit..           z =e= 3*x1-5*x2+x3;
restriction_1..     x1 - x3 =e= 1;
restriction_2..     3*x1 + 2*x2 -7*x3 =e= 5;

Model example1 /all/;
Solve example1 using lp minimizing z;