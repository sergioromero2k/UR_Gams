Variables
    x1    "Variable x1"
    x2    "Variable x2"
    x3    "Variable x3"
    z     "Objective function value";

Positive Variables x1, x2, x3;

Equations
    objective    "Objective function to minimize"
    constraint   "System constraint";

* Equation definitions
objective..    z =e= 1*x1 + 3*x2 + 4*x3;
constraint..   x1 + 2*x2 + 1*x3 =e= 5;

Model problem2 /all/;

* Solve the model using Linear Programming (LP)
Solve problem2 minimizing z using lp;

* Display results in the .lst file
Display x1.l, x2.l, x3.l, z.l;