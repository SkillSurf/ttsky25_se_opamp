# A Low-power Single-ended Operational Amplifier using Sky130 PDK

This guide provides a reference design for a single-ended op-amp circuit using the SKY130 PDK, intended to function as a non-inverting unity-gain buffer for low-frequency analog signals (1–10 kHz). 

The following figures show the schematic of the circuit and the layout in Klayout.

<p align="center">
<img src = "./assets/Schematic.png" width = "500" height = "500">
</p>

## Project Requirements

| Parameter | Value |
| --- | --- |
| Supply voltage (vdd) | 1.7 V - 1.9 V |
| Nominal input common-mode voltage | (vdd/2 - 0.2V) - (vdd/2 + 0.2V) |
| Output load $C_{L}$ | 500fF (capacitive) |
| Temperature range | 20° C - 50° C |
| Input signal amplitude | $\lt 0.4$ $V_{pp}$ |
| Input signal frequency | 1 - 10 kHz |
| Input bias current | 5 \mu A |
| Open-loop low-freq (DC) Gain | $\geq 60$ dB ($\geq 1000$)|
| Gain bandwidth product GBW | $\geq 1$ MHz |
| Phase margin PM | $\gt 60°$ |
| Quiescent current | $\lt 100$ uA |
| Input offset | $\lt 3$ mV |
| Slew rate SR (open-loop & closed-loop) | $\gt 1 V/\mu$ s |
| Disable current | $\lt 2$ nA |
| Final layout area | within 140 $\mu$ m x 80 $\mu$ m |


## Technology parameters
A detailed explanation of technology parameters can be found here: https://skywater-pdk.readthedocs.io/en/main/index.html

| Parameter | nMOS | pMOS |
| --- | --- | --- |
| $V_{th}$ (V) | 0.49439 | -1.0652 |
| $\mu_0 (\frac{cm^2}{V\cdot s})$ | 301.97 | 24.424 |
| $t_{ox}$ (nm)| 4.148 | 4.23 |

where
$V_{th}$ is the threshold voltage, $\mu_0$ is the carrier mobility and $t_{ox}$ is the oxide thickness.

We also have $\epsilon_{rox} = 3.9$ and the vacuum electrical permitivitty is $\epsilon_0 = 8.8541 \cdot 10^{-12} \frac{F}{m}$. With that we can find $C_{ox}$,

For the pMOS:
$$C_{ox} = \epsilon_0 \cdot \frac{\epsilon_{rox}}{t_{ox}} = 8.163\cdot 10^{-3} \frac{F}{m^2}$$
For the nMOS:
$$C_{ox} = 8.325\cdot 10^{-3} \frac{F}{m^2} $$



## Mathematical calculations

According to the specifications set above, we will have to design the operational amplifier with two stages to achieve the set gain and GBW requirements. Hence, we can initiate our design with a general structure of a two-stage Op-amp and derive the device specific parameters for our custom design. 

More specifically, we need to calculate the W/L ratios of all the transistors, miller capacitor value and the currents in each branch. 

There are several **Rules of thumb** which we can use as starting points along with the equations for calculating different parameters (derivations of these equations can be found from textbooks). 
- $C_{miller}$ $\geq 0.22$ $C_{load}$ for phase margin to be greater than 60. 
- $V_{D,sat}$ $\gt 100$ mV
- W/L ratio of PMOS in the differential pair is roughly 2.5 times the W/L ratio of NMOS (this is not a hard rule!)


Using the first rule of thumb, 
we can calculate $C_{miller}$ to be $\geq 11$ pF. we can take $C_{miller}$ = 12pF for our calculations (this value could change during simulations).

We can then calculate the minimum bias current sinking from the differential pair ($I_{5}$) using the expected minimum slew rate. It needs to be noted that, in a two-stage Opamp, the slew rate depends on how fast the miller capacitor can be charged and discharged with the current in the differential pair. 

$$ SR = \frac{I_{5}}{C_{miller}} \gt 1 V/ \mu s$$

$$ I_{5} \gt SR * C_{miller} = 12 \ \mu A $$

we can take $I_{5}$= 18 $\mu A.$


With this we can find $g_{m1}$,

$$ GBW = \frac{g_{m1}}{2\pi \cdot C_{miller}} \geq 1$ MHz$$

$$ g_{m1} \geq 75.4 \ \mu S $$

we can assume $g_{m1}$= 80 $\mu S.$

With that know, we can calculate the W/L ratio for the two NMOS transistors in the differential pair. 

$$ \left(\frac{W}{L}\right)\_{1,2} = \frac{g_{m1}^2}{\mu_{0n} \cdot C_{oxn} \cdot I_{5}} = 1.3 $$


Afterwards, we can calculate the W/L ratio of the to PMOS transistors of the differential pari using the relationship 

$$ ICMR_{(+)} \leq V_{D1,min} * V_{thn,min}  $$




<p align="center">
<img src = "./assets/AC_analysis.png" width = "500" height = "500">
</p>

<p align="center">
<img src = "./assets/transient.png" width = "500" height = "500">
</p>

<p align="center">
<img src = "./assets/Operating_point.png" width = "500" height = "500">
</p>

