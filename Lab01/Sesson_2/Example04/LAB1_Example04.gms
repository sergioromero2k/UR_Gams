Free Variables z;
Binary Variables x1, x2;

Equations
    benefit
    rest1
    rest2
    rest3
;

benefit..   z =e= 24*x1 + 18*x2;
rest1..     3*x1 + 4*x2 =l= 12;
rest2..     3*x1 + 3*x2 =l= 10;
rest3..     4*x1 + 2*x2 =l= 8;
;

Model example04 /all/;
Solve example04 using mip maximizing z;
    
Display x1.l, x2.l, z.l;
