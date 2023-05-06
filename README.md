# Adaptive-Control-Aircraft-Stabilization
We are given a dynamic system with a known equation, but unknown variables. The end goal of this assignment is to design an adaptive controller that renders all the signals of the closed loop bounded whilst simultaneously the closed loop system behaves like the following reference model:
<p align="center">
<img src="https://render.githubusercontent.com/render/math?math=\phi_ref(s) = (1/(s^2 + 1.4s + 1)) * r(s)">
</p>
More specifically, we must perform the following steps before reaching our end goal:

1. Proving that (0,0) is an unstable equilibrium point of the open loop system.
2. Proving the existence of a limit cycle using a phase portrait.
3. Given that the system simulates the ***roll*** movement of an aircraft, describe the behavior of the open loop system.
4. Design the adaptive controller.
5. Simulate the response of the closed loop system for given inputs.

### Note
The pdf file named Adaptive-Control-Aircraft-Stabilization is effectively the whole assignment description. However I added this README file since the pdf file is in greek. This is an experimental application developed as part of the course "Intelligent & Adaptive Control Systems" assignment, that took place in the Department of Electrical & Computer Engineering at Aristotle University of Thessaloniki in 2020.
