Sets
    i 'Types of computers'  / A, B, C/
    j 'Operations'          / CC1, CC2, MNT /;
    
Parameters
    prices(i)
    /
        A 350
        B 470
        C 610
    /
    
    resources(j)
    /
        CC1 120
        CC2 48
        MNT 2000
    /;
    
Table mtecn(i,j)
        CC1 CC2 MNT
    A   1   0   10
    B   1   0   15
    C   0   1   20;
    
Free Variables
    z;

Positive Variables
    x(i);

* General Equations
Equations
    benefit
    limits_resource(j);
    
benefit..               z =e= sum(i, prices(i) * x(i));
limits_resource(j)..    sum(i, mtecn(i,j) * x(i)) =l= resources(j);

* Model's definition
Model Pece /all/;

* Resolution
Solve Pece using lp maximizing z;

* Show key results.
Display
    x.l
    z.l;

