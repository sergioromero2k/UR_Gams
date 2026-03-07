Free Variables x3, z;
Positive Variables x2;
Negative Variables x1;

* Note: Since x1, x2, x3 are different types, 
* it is often easier to write them manually or use an alias.
* Let's simplify the equations to match your manual notes exactly:

Equations benefit, rest1, rest2;

benefit..      z =e= 8*x1 + 3*x2 - 2*x3;
rest1..          x1 - 6*x2 + x3 =g= 2;
rest2..          5*x1 + 7*x2 - 2*x3 =e= -4;
;

Model Example06 /all/;
Solve Example06 using lp maximizing z;