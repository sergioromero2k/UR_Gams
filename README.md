# Optimización Matemática con GAMS: Guía Teórica y Práctica

Este repositorio está dedicado al estudio y resolución de problemas de programación matemática utilizando **GAMS** (General Algebraic Modeling System). La optimización es un pilar fundamental en la toma de decisiones basada en datos, permitiendo encontrar la mejor solución posible bajo un conjunto de restricciones dadas.

---

## 1. Fundamentos Teóricos

Un problema de optimización matemática se compone de tres elementos principales:

- **Variables de Decisión:** Son las incógnitas que el modelo debe determinar (ej. cantidad de producto a fabricar). Pueden ser:
  - **Continuas:** Pueden tomar cualquier valor real (ej. $x \geq 0$).
  - **Enteras:** Solo toman valores discretos ($x \in \mathbb{Z}$).
  - **Binarias:** Solo pueden ser 0 o 1 (útiles para decisiones de sí/no).

- **Función Objetivo:** Es la expresión matemática que queremos maximizar (beneficios, eficiencia) o minimizar (costes, tiempo, errores).

- **Restricciones:** Conjunto de igualdades o desigualdades que limitan el espacio de soluciones posibles (recursos limitados, leyes físicas, demandas de mercado).

### Tipos de Modelos comunes en GAMS

- **LP (Linear Programming):** Tanto la función objetivo como las restricciones son lineales.
- **MIP (Mixed Integer Programming):** Problemas que incluyen variables enteras o binarias.

---

## 2. Estructura de un Modelo en GAMS

Para resolver un problema en GAMS, el código debe seguir un orden lógico que define la estructura del modelo:

### A. Declaración de Conjuntos (`Sets`)

Se utilizan para indexar variables y parámetros, permitiendo que el modelo sea escalable.
```gams
Sets
    i  "Tipos de productos" /A, B, C/
    j  "Centros de distribución" /C1, C2/;
```

### B. Datos (`Parameters`, `Tables`)

Aquí se definen las constantes del problema.

- **Parameters:** Valores escalares o vectores.
- **Tables:** Matrices de datos (ej. matriz tecnológica).

### C. Variables (`Variables`)

Se debe especificar su naturaleza:

- `Free Variables`: Pueden ser positivas o negativas (habitual para la variable $Z$ del beneficio).
- `Positive Variables`: $x \geq 0$.
- `Integer Variables`: $x \in \{0, 1, 2, ...\}$.
- `Binary Variables`: $x \in \{0, 1\}$.

### D. Ecuaciones (`Equations`)

Primero se declaran sus nombres y luego se define su contenido matemático.

| Operador | Significado             |
|----------|-------------------------|
| `=e=`    | Igualdad ($=$)          |
| `=l=`    | Menor o igual ($\leq$)  |
| `=g=`    | Mayor o igual ($\geq$)  |

### E. Ejecución (`Model` y `Solve`)

Se agrupan las ecuaciones y se llama al optimizador indicando el tipo de problema y el objetivo.

---

## 3. Ejemplo de Implementación Teórica

### Notación Algebraica (Problema Directo)

Ideal para problemas pequeños con pocas variables.
```gams
Variables z;
Positive Variables x1, x2;

Equations objetivo, restriccion1;

objetivo..      z =e= 10*x1 + 15*x2;
restriccion1..  2*x1 + 3*x2 =l= 20;

Model mi_modelo /all/;
Solve mi_modelo using lp maximizing z;
```

### Notación Matricial (Problema Escalable)

Se utiliza `sum()` para manejar grandes volúmenes de datos de forma eficiente.
```gams
Equation beneficio;
beneficio..  z =e= sum(i, precios(i) * x(i));
```

---

## 4. Consejos para la Depuración

- **Check de Sintaxis:** GAMS indicará errores con el símbolo `****` en el archivo de salida.
- **Model Status:** Verifica si el modelo es `Optimal` (solución encontrada) o `Infeasible` (no hay solución que cumpla las restricciones).