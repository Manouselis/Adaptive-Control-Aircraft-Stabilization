# Adaptive-Control-Aircraft-Stabilization
We are given a dynamic system with a known equation, but unknown variables. The end goal of this assignment is to design an adaptive controller that renders all the signals of the closed loop bounded whilst simultaneously the closed loop system behaves like the following reference model:
<p align="center">
<img src="https://render.githubusercontent.com/render/math?math=\varphi_{ref}(s)=\frac{1}{s^2+1,4s+1}r(s)">
</p>
More specifically, we have to perform the following steps before reaching our end goal:

1. Proving that (0,0) is an unstable equilibrium point of the open loop system.
2. Proving the existance of a limit cycle using a phase portrait.
3. Given that the system simulates the ***roll*** movement of an aircraft, describe the behaviour of the open loop system.
4. Design the adaptive controller.
5. Simulate the response of the closed loop system for given inputs.
