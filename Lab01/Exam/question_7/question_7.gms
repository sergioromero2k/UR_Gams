Variables
    x1, x2, x3, z;

Positive Variables x1, x2, x3;

Equations
    obj, constr, fixed_x2;

obj..       z =e= x1 + 3*x2 + 4*x3;
constr..    x1 + 2*x2 + x3 =e= 5;
fixed_x2..  x2 =e= 2;

Model problema /all/;
Solve problema minimizing z using lp;

Display x1.l, x2.l, x3.l, z.l;