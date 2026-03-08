Variables
    x1, x2, x3, z;

Positive Variables
    x1, x2, x3;

Equations
    objective, constr1, constr2, constr3;

* Defining the objective function
objective.. z =e= 4*x1 + 8*x2 - 6*x3;

* Defining the constraints
constr1.. 3*x1 + x2 =l= 12;
constr2.. 3*x1 + x2 =l= 10;
constr3.. 4*x1 + 2*x2 =l= 18;

Model maximize_profit /all/;

Solve maximize_profit using lp maximizing z;

Display x1.l, x2.l, x3.l, z.l;