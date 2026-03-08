Variables
    x1, x2, x3, z;

* Note: The problem only specifies non-negativity for x2 and x3.
* x1 is free (unconstrained) unless otherwise implied.
Positive Variables
    x2, x3;

Equations
    obj       "Objective function"
    eq1       "First constraint"
    eq2       "Second constraint";

* Objective: minimize z = x1 + 3*x2 + 4*x3
obj.. z =e= x1 + 3*x2 + 4*x3;

* Constraints
eq1.. x1 + 2*x2 + x3 =e= 5;
eq2.. 2*x1 + 3*x2 + x3 =e= 6;

Model min_problem /all/;

Solve min_problem using lp minimizing z;

* Display the results to verify x1
Display x1.l, x2.l, x3.l, z.l;