Free Variables
    z;
    
Positive Variables
    x1
    x2;
    
Equations
    benefit
    restriction_1
    restriction_2;

benefit..           z =e= 100*x1 + 125*x2;
restriction_1..     3*x1 + 5*x2 =L= 15;
restriction_2..     90*x1 + 85*x2 =L= 350;


Model Lab1_Example01 /all/;
Solve Lab1_Example01 using lp maximizing z;  
