***** Project: Mining - Example
***** Objective: Maximize benefit 24x1 + 18x2

Variables
    z       'Benefit total';

Positive Variables
    x1      'Quantity of the product 1'
    x2      'Quantity of the product 2'; 
    
Equations
    benefit
    restriction_1
    restriction_2
    restriction_3;
    
benefit..           z =e= 24*x1 + 18*x2;

restriction_1..     3*x1 + 4*x2 =L= 12;
restriction_2..     3*x1 + 3*x2 =L= 10;
restriction_3..     4*x1 + 2*x2 =L= 8;

Model mining /all/;

Solve mining using lp maximizing z;

Display
    x1.l
    x2.l
    z.l;