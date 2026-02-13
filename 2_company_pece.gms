Free Variables
z;

Positive Variables
xa, xb, xc
;


Equations
beneficio
restriction_1
restriction_2
restriction_3
;

beneficio..             z =e= 350*xa +  470*xb + 610*xc;
restriction_1..         xa + xb =l= 120;
restriction_2..         xc =L= 48;
restriction_3..         10*xa + 15*xb + 20*xc =l= 2000;
;

Model Company_Pece /all/;
Solve Company_Pece using LP maximizing z;

Display xa.l, xb.l, xc.l, z.l;