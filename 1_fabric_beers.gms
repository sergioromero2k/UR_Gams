***** LAB 1
***** Ejample1

Free Variables
z;

$ontext
Positive Variables
x1, x2
;
$offText

$ontext
Integer Variables
x1, x2
;
$offtext

Binary Variables
x1, x2
;

Equations
beneficio
restriccion_1
restriccion_2
;

beneficio..         z =e= 100*x1 +125*x2;
restriccion_1..     3*x1 + 5*x2 =L= 15;
restriccion_2..     90*x1 + 85*x2 =L= 350;
;

Model Lab1_Ejemplo01 /all/;
* Solve Lab1_Ejemplo01 usign LP maximizing z;
Solve Lab1_Ejemplo01 usign MIP maximizing z;
