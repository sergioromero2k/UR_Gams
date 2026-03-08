Variable z;
Binary Variables x1, x2, x3;

Equations benefit, rest1, rest2;
    benefit..   z =e= 3*x1 + x2 + 3*x3;
    rest1..     2*x1 + x2 + x3 =l= 2;
    rest2..     x1 + 2*x2 + 3*x3 =l= 5;
    ;
    
Model question_1 /all/;
Solve question_1 using mip maximizing z;