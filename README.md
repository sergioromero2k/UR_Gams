# Optimización Matemática con GAMS: Guía Teórica y Práctica

Este repositorio está dedicado al estudio y resolución de problemas de programación matemática utilizando **GAMS** (General Algebraic Modeling System). La optimización es un pilar fundamental en la toma de decisiones basada en datos, permitiendo encontrar la mejor solución posible bajo un conjunto de restricciones dadas.

---

## 1. Fundamentos Teóricos

Un problema de optimización matemática se compone de tres elementos principales:

- **Variables de Decisión:** Son las incógnitas que el modelo debe determinar (ej. cantidad de producto a fabricar). Pueden ser:
  - **Continuas:** Pueden tomar cualquier valor real (ej. $x \geq 0$).
  - **Enteras:** Solo toman valores discretos ($x \in \mathbb{Z}$).
  - **Binarias:** Solo pueden ser 0 o 1 (útiles para decisiones de sí/no).
- **Función Objetivo:** Expresión matemática que queremos maximizar (beneficios, eficiencia) o minimizar (costes, tiempo, errores).
- **Restricciones:** Igualdades o desigualdades que limitan el espacio de soluciones posibles (recursos limitados, leyes físicas, demandas de mercado).

### Tipos de Modelos comunes en GAMS

- **LP (Linear Programming):** Función objetivo y restricciones lineales, con variables continuas.
- **MIP (Mixed Integer Programming):** Igual que LP pero admite variables enteras o binarias.

---

## 2. Estructura de un Modelo en GAMS

### A. Conjuntos (`Sets`)

Indexan variables y parámetros para que el modelo sea escalable.
```gams
Sets
    i  "Tipos de productos"      /A, B, C/
    j  "Centros de distribución" /C1, C2/;
```

### B. Datos (`Parameters`, `Tables`)

- **Parameters:** Valores escalares o vectores.
- **Tables:** Matrices de datos (ej. matriz tecnológica).

### C. Variables

| Tipo | Sintaxis | Dominio |
|------|----------|---------|
| Libre | `Variable z;` | ±∞ |
| Libre explícito | `Free Variable z;` | ±∞, equivalente a `Variable` |
| Positiva | `Positive Variables x1, x2;` | ≥ 0 |
| Entera | `Integer Variables x1, x2;` | enteros ≥ 0 |
| Binaria | `Binary Variables x1, x2;` | {0, 1} |

> 💡 **Tip:** deja `z` como libre y `x1, x2` como positivas o enteras según LP o MIP.

### D. Ecuaciones (`Equations`)

Se declaran primero los nombres y luego se define su contenido matemático. La doble `..` es siempre obligatoria.

| Operador | Significado |
|----------|-------------|
| `=e=` | Igualdad ($=$) |
| `=l=` | Menor o igual ($\leq$) |
| `=g=` | Mayor o igual ($\geq$) |

### E. Modelo y Ejecución (`Model` y `Solve`)

Se agrupan las ecuaciones y se llama al optimizador indicando el tipo de problema y el objetivo.
```gams
Model mi_modelo /all/;         * /all/ incluye todas las ecuaciones
* Model mi_modelo /r1, r2/;   * o lista solo las que necesites
Solve mi_modelo using LP  maximizing z;
Solve mi_modelo using MIP maximizing z;
```

- `LP` → variables continuas
- `MIP` → variables enteras o binarias
- `maximizing` / `minimizing` → sentido de la función objetivo

> 💡 **Tip:** el `Model` es obligatorio antes del `Solve`.

---

## 3. Comentarios en GAMS

**Línea:**
```gams
* Esto es un comentario
```

**Bloque:**
```gams
$ontext
Todo lo que esté aquí se ignora
$offtext
```

> 💡 **Tip:** usa `$ontext ... $offtext` para desactivar bloques de código sin borrarlos (ej. alternar entre versión LP y MIP).

---

## 4. Ejemplos de Implementación

### Notación Algebraica (Problema Directo)

Ideal para problemas pequeños con pocas variables.
```gams
Variable z;
Positive Variables x1, x2;

Equations objetivo, r1, r2;

objetivo.. z  =e= 100*x1 + 125*x2;
r1..       3*x1 +  5*x2 =l= 15;
r2..      90*x1 + 85*x2 =l= 350;

Model mi_modelo /all/;
Solve mi_modelo using lp maximizing z;
```

### Notación Matricial (Problema Escalable)

Se utiliza `sum()` para manejar grandes volúmenes de datos de forma eficiente.
```gams
Equation beneficio;
beneficio.. z =e= sum(i, precios(i) * x(i));
```

---

## 5. Consejos para la Depuración y Estilo

- **Sintaxis:** GAMS señala errores con `****` en el archivo de salida; corrígelos antes de volver a ejecutar.
- **Model Status:** El resultado debe ser `Optimal`. Si aparece `Infeasible`, alguna restricción es imposible de satisfacer; revisa los datos y los límites del modelo.
- Termina **todas** las sentencias con `;`.
- Mantén la variable objetivo separada de las restricciones para mayor claridad.
- Si cambias el tipo de variables (continuas → enteras → binarias), recuerda ajustar el `Solve`.
- Nombra las ecuaciones de forma corta (`r1`, `r2`) para agilizar el trabajo.
- Comenta siempre los bloques alternativos que dejes desactivados, por ejemplo:
```gams
$ontext
Integer Variables x1, x2;
$offtext
```
