## Example - PECE Company
---

The **PECE company** sells computers and must plan production for the next week. The company produces three types of computers: desktop (A), standard laptop (B), and luxury laptop (C).
The net profit per computer sold is 350, 470, and 610 euros, respectively.

Each week, all assembled units are sold. The computers undergo a quality control of 1 hour, and the company has 120 hours available to perform quality controls for computers A and B, and 48 hours for C. The remaining assembly operations require 10, 15, and 20 hours, respectively, and the company has 2000 hours per week.

$$\text{max } 350x_A + 470x_B + 610x_C$$

$$\text{s.t.} \quad x_A + x_B \leq 120$$

$$x_C \leq 48$$

$$10x_A + 15x_B + 20x_C \leq 2000$$

$$x_A, x_B, x_C \geq 0$$