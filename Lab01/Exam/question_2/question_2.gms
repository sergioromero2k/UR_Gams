Free Variables

       z beneficio

Positive Variables

         x1, x2, x3;

Equations

         beneficio beneficios

         restricc1

         restricc2

         restricc3;

         beneficio..      z =e= 4*x1 + 8*x2;

         restricc1..      3*x1 +   x2 =l= 12;

         restricc2..      3*x1 +   x2 =l= 10;

         restricc3..      4*x1 + 2*x2 =l= 8;

;

Model pregunta /all/;

Solve pregunta using lp maximizing z;