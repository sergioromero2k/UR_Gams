# Mathematical Optimization with GAMS

This repository is dedicated to the study and resolution of mathematical programming problems using **GAMS** (General Algebraic Modeling System). Optimization is a fundamental pillar in data-driven decision making, allowing us to find the best possible solution under a given set of constraints.

---

## 1. Theoretical Foundations

A mathematical optimization problem consists of three main elements:

- **Decision Variables:** The unknowns that the model must determine (e.g., quantity of product to manufacture). They can be:
  - **Continuous:** Can take any real value (e.g., $x \geq 0$).
  - **Integer:** Only take discrete values ($x \in \mathbb{Z}$).
  - **Binary:** Can only be 0 or 1 (useful for yes/no decisions).
- **Objective Function:** Mathematical expression that we want to maximize (profit, efficiency) or minimize (costs, time, errors).
- **Constraints:** Equalities or inequalities that limit the space of feasible solutions (limited resources, physical laws, market demands).

### Common Model Types in GAMS

- **LP (Linear Programming):** Linear objective function and constraints, with continuous variables.
- **MIP (Mixed Integer Programming):** Same as LP but allows integer or binary variables.

---

## 2. Structure of a GAMS Model

### A. Sets

Index variables and parameters to make the model scalable.
```gams
Sets
    i  "Product types"           /A, B, C/
    j  "Distribution centers"    /C1, C2/;
```

### B. Data (`Parameters`, `Tables`)

- **Parameters:** Scalar values or vectors.
- **Tables:** Data matrices (e.g., technology matrix).

### C. Variables

| Type | Syntax | Domain |
|------|--------|--------|
| Free | `Variable z;` | ±∞ |
| Free explicit | `Free Variable z;` | ±∞, equivalent to `Variable` |
| Positive | `Positive Variables x1, x2;` | ≥ 0 |
| Integer | `Integer Variables x1, x2;` | integers ≥ 0 |
| Binary | `Binary Variables x1, x2;` | {0, 1} |

> **Tip:** Leave `z` as free and `x1, x2` as positive or integer depending on LP or MIP.

### D. Equations

Names are declared first, then their mathematical content is defined. The double `..` is always required.

| Operator | Meaning |
|----------|---------|
| `=e=` | Equality ($=$) |
| `=l=` | Less than or equal ($\leq$) |
| `=g=` | Greater than or equal ($\geq$) |

### E. Model and Execution (`Model` and `Solve`)

Equations are grouped and the optimizer is called specifying the problem type and objective.
```gams
Model my_model /all/;          * /all/ includes all equations
* Model my_model /r1, r2/;    * or list only the ones you need
Solve my_model using LP  maximizing z;
Solve my_model using MIP maximizing z;
```

- `LP` → continuous variables
- `MIP` → integer or binary variables
- `maximizing` / `minimizing` → direction of the objective function

> **Tip:** The `Model` statement is mandatory before `Solve`.

---

## 3. Comments in GAMS

**Single line:**
```gams
* This is a comment
```

**Block:**
```gams
$ontext
Everything here is ignored
$offtext
```

> **Tip:** Use `$ontext ... $offtext` to disable code blocks without deleting them (e.g., switching between LP and MIP versions).

---

## 4. Implementation Examples

### Algebraic Notation (Direct Problem)

Ideal for small problems with few variables.
```gams
Variable z;
Positive Variables x1, x2;

Equations objective, r1, r2;

objective.. z  =e= 100*x1 + 125*x2;
r1..        3*x1 +  5*x2 =l= 15;
r2..       90*x1 + 85*x2 =l= 350;

Model my_model /all/;
Solve my_model using lp maximizing z;
```

### Matrix Notation (Scalable Problem)

Uses `sum()` to handle large volumes of data efficiently.
```gams
Equation profit;
profit.. z =e= sum(i, prices(i) * x(i));
```

---

## 5. Debugging and Style Tips

- **Syntax:** GAMS flags errors with `****` in the output file; fix them before re-running.
- **Model Status:** The result should be `Optimal`. If `Infeasible` appears, some constraint cannot be satisfied; review the data and model bounds.
- End **all** statements with `;`.
- Keep the objective variable separate from constraints for clarity.
- If you change variable types (continuous → integer → binary), remember to update the `Solve` statement.
- Name equations with short labels (`r1`, `r2`) to speed up development.
- Always comment out alternative blocks you leave disabled, for example:
```gams
$ontext
Integer Variables x1, x2;
$offtext
```