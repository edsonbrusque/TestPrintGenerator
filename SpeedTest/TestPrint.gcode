; Brusque's 3D Printer Test GCODE Generator

; Reading parameters from config.txt
; totalHeight = 50.00
; filamentDiameter = 1.75
; firstLayerHeight = 0.20
; bedTemperature = 80.00
; brimCount = 5.00
; zSpeed = 10.00
; minRetractDistance = 1.00
; fanStartHeight = 0.60
; layerHeight = 0.20
; layerHeightStart = 0.20
; layerHeightFinish = 0.20
; layerWidth = 0.40
; layerWidthStart = 0.40
; layerWidthFinish = 0.40
; printSpeed = 20.00
; printSpeedStart = 20.00
; printSpeedFinish = 220.00
; travelSpeed = 120.00
; travelSpeedStart = 20.00
; travelSpeedFinish = 220.00
; retractLength = 1.00
; retractLengthStart = 1.00
; retractLengthFinish = 1.00
; retractSpeed = 25.00
; retractSpeedStart = 25.00
; retractSpeedFinish = 25.00
; temperature = 230.00
; temperatureStart = 230.00
; temperatureFinish = 230.00
; fanSpeed = 0.00
; fanSpeedStart = 0.00
; fanSpeedFinish = 0.00

; Reading figure from pattern.txt
; 10.00 50.00 1.00
; 190.00 50.00 1.00
; 190.00 150.00 1.00

M220 S100 ; Reset Feedrate
M221 S100 ; Reset Flowrate

M140 S80.00  ; Start preheating the bed
M190 S80.00  ; WAIT
M104 S230.00 ; start preheating the hotend
M109 S230.00 ; WAIT

G28 ; Homing
M420 S0 ; Turn bed leveling off

G90 ; Absolute positioning
M83 ; Relative extrusion

M117 Priming
G1 X0.0 Y0.0 F5000.0 ; Move to start position
G1 X0.0 Y0.0 Z0.2 F5000.0 ; Lower Head
G1 X200 Y0.0 Z0.2 F1500.0 E15 ; Draw the first line
G1 X200 Y0.4 Z0.2 F5000.0 ; Move back a little
G1 X0.0 Y0.4 Z0.2 F1500.0 E30 ; Draw the second line

M117 Moving to start position
G1 F1500.00 E-1.00
G0 F600.00 Z10.00
G0 F7200.00 X10.00 Y50.00

M117 Brim
M106 S0.00
G0 F600.00 Z0.20
G1 F1500.00 E1.00
G1 F1200.00 X8.00 Y48.00 E0.09
G1 F1200.00 X192.00 Y48.00 E6.12
G1 F1200.00 X192.00 Y152.00 E3.46

G1 F1200.00 X8.40 Y48.40 E7.01
G1 F1200.00 X191.60 Y48.40 E6.09
G1 F1200.00 X191.60 Y151.60 E3.43

G1 F1200.00 X8.80 Y48.80 E6.98
G1 F1200.00 X191.20 Y48.80 E6.07
G1 F1200.00 X191.20 Y151.20 E3.41

G1 F1200.00 X9.20 Y49.20 E6.94
G1 F1200.00 X190.80 Y49.20 E6.04
G1 F1200.00 X190.80 Y150.80 E3.38

G1 F1200.00 X9.60 Y49.60 E6.90
G1 F1200.00 X190.40 Y49.60 E6.01
G1 F1200.00 X190.40 Y150.40 E3.35

M117 S=20.00mm/s T=20.00mm/s
M104 S230.00
G1 F1200.00 X10.00 Y50.00 E6.87
G1 F1200.00 X190.00 Y50.00 E5.99
G1 F1200.00 X190.00 Y150.00 E3.33

M117 S=20.80mm/s T=20.80mm/s
G0 F600.00 Z0.40
G1 F1248.19 X10.00 Y50.00 E6.85
G1 F1248.19 X190.00 Y50.00 E5.99
G1 F1248.19 X190.00 Y150.00 E3.33

M117 S=21.61mm/s T=21.61mm/s
G0 F600.00 Z0.60
G1 F1296.39 X10.00 Y50.00 E6.85
G1 F1296.39 X190.00 Y50.00 E5.99
G1 F1296.39 X190.00 Y150.00 E3.33

M117 S=22.41mm/s T=22.41mm/s
G0 F600.00 Z0.80
G1 F1344.58 X10.00 Y50.00 E6.85
G1 F1344.58 X190.00 Y50.00 E5.99
G1 F1344.58 X190.00 Y150.00 E3.33

M117 S=23.21mm/s T=23.21mm/s
G0 F600.00 Z1.00
G1 F1392.77 X10.00 Y50.00 E6.85
G1 F1392.77 X190.00 Y50.00 E5.99
G1 F1392.77 X190.00 Y150.00 E3.33

M117 S=24.02mm/s T=24.02mm/s
G0 F600.00 Z1.20
G1 F1440.96 X10.00 Y50.00 E6.85
G1 F1440.96 X190.00 Y50.00 E5.99
G1 F1440.96 X190.00 Y150.00 E3.33

M117 S=24.82mm/s T=24.82mm/s
G0 F600.00 Z1.40
G1 F1489.16 X10.00 Y50.00 E6.85
G1 F1489.16 X190.00 Y50.00 E5.99
G1 F1489.16 X190.00 Y150.00 E3.33

M117 S=25.62mm/s T=25.62mm/s
G0 F600.00 Z1.60
G1 F1537.35 X10.00 Y50.00 E6.85
G1 F1537.35 X190.00 Y50.00 E5.99
G1 F1537.35 X190.00 Y150.00 E3.33

M117 S=26.43mm/s T=26.43mm/s
G0 F600.00 Z1.80
G1 F1585.54 X10.00 Y50.00 E6.85
G1 F1585.54 X190.00 Y50.00 E5.99
G1 F1585.54 X190.00 Y150.00 E3.33

M117 S=27.23mm/s T=27.23mm/s
G0 F600.00 Z2.00
G1 F1633.73 X10.00 Y50.00 E6.85
G1 F1633.73 X190.00 Y50.00 E5.99
G1 F1633.73 X190.00 Y150.00 E3.33

M117 S=28.03mm/s T=28.03mm/s
G0 F600.00 Z2.20
G1 F1681.93 X10.00 Y50.00 E6.85
G1 F1681.93 X190.00 Y50.00 E5.99
G1 F1681.93 X190.00 Y150.00 E3.33

M117 S=28.84mm/s T=28.84mm/s
G0 F600.00 Z2.40
G1 F1730.12 X10.00 Y50.00 E6.85
G1 F1730.12 X190.00 Y50.00 E5.99
G1 F1730.12 X190.00 Y150.00 E3.33

M117 S=29.64mm/s T=29.64mm/s
G0 F600.00 Z2.60
G1 F1778.31 X10.00 Y50.00 E6.85
G1 F1778.31 X190.00 Y50.00 E5.99
G1 F1778.31 X190.00 Y150.00 E3.33

M117 S=30.44mm/s T=30.44mm/s
G0 F600.00 Z2.80
G1 F1826.51 X10.00 Y50.00 E6.85
G1 F1826.51 X190.00 Y50.00 E5.99
G1 F1826.51 X190.00 Y150.00 E3.33

M117 S=31.24mm/s T=31.24mm/s
G0 F600.00 Z3.00
G1 F1874.70 X10.00 Y50.00 E6.85
G1 F1874.70 X190.00 Y50.00 E5.99
G1 F1874.70 X190.00 Y150.00 E3.33

M117 S=32.05mm/s T=32.05mm/s
G0 F600.00 Z3.20
G1 F1922.89 X10.00 Y50.00 E6.85
G1 F1922.89 X190.00 Y50.00 E5.99
G1 F1922.89 X190.00 Y150.00 E3.33

M117 S=32.85mm/s T=32.85mm/s
G0 F600.00 Z3.40
G1 F1971.08 X10.00 Y50.00 E6.85
G1 F1971.08 X190.00 Y50.00 E5.99
G1 F1971.08 X190.00 Y150.00 E3.33

M117 S=33.65mm/s T=33.65mm/s
G0 F600.00 Z3.60
G1 F2019.28 X10.00 Y50.00 E6.85
G1 F2019.28 X190.00 Y50.00 E5.99
G1 F2019.28 X190.00 Y150.00 E3.33

M117 S=34.46mm/s T=34.46mm/s
G0 F600.00 Z3.80
G1 F2067.47 X10.00 Y50.00 E6.85
G1 F2067.47 X190.00 Y50.00 E5.99
G1 F2067.47 X190.00 Y150.00 E3.33

M117 S=35.26mm/s T=35.26mm/s
G0 F600.00 Z4.00
G1 F2115.66 X10.00 Y50.00 E6.85
G1 F2115.66 X190.00 Y50.00 E5.99
G1 F2115.66 X190.00 Y150.00 E3.33

M117 S=36.06mm/s T=36.06mm/s
G0 F600.00 Z4.20
G1 F2163.86 X10.00 Y50.00 E6.85
G1 F2163.86 X190.00 Y50.00 E5.99
G1 F2163.86 X190.00 Y150.00 E3.33

M117 S=36.87mm/s T=36.87mm/s
G0 F600.00 Z4.40
G1 F2212.05 X10.00 Y50.00 E6.85
G1 F2212.05 X190.00 Y50.00 E5.99
G1 F2212.05 X190.00 Y150.00 E3.33

M117 S=37.67mm/s T=37.67mm/s
G0 F600.00 Z4.60
G1 F2260.24 X10.00 Y50.00 E6.85
G1 F2260.24 X190.00 Y50.00 E5.99
G1 F2260.24 X190.00 Y150.00 E3.33

M117 S=38.47mm/s T=38.47mm/s
G0 F600.00 Z4.80
G1 F2308.43 X10.00 Y50.00 E6.85
G1 F2308.43 X190.00 Y50.00 E5.99
G1 F2308.43 X190.00 Y150.00 E3.33

M117 S=39.28mm/s T=39.28mm/s
G0 F600.00 Z5.00
G1 F2356.63 X10.00 Y50.00 E6.85
G1 F2356.63 X190.00 Y50.00 E5.99
G1 F2356.63 X190.00 Y150.00 E3.33

M117 S=40.08mm/s T=40.08mm/s
G0 F600.00 Z5.20
G1 F2404.82 X10.00 Y50.00 E6.85
G1 F2404.82 X190.00 Y50.00 E5.99
G1 F2404.82 X190.00 Y150.00 E3.33

M117 S=40.88mm/s T=40.88mm/s
G0 F600.00 Z5.40
G1 F2453.01 X10.00 Y50.00 E6.85
G1 F2453.01 X190.00 Y50.00 E5.99
G1 F2453.01 X190.00 Y150.00 E3.33

M117 S=41.69mm/s T=41.69mm/s
G0 F600.00 Z5.60
G1 F2501.20 X10.00 Y50.00 E6.85
G1 F2501.20 X190.00 Y50.00 E5.99
G1 F2501.20 X190.00 Y150.00 E3.33

M117 S=42.49mm/s T=42.49mm/s
G0 F600.00 Z5.80
G1 F2549.40 X10.00 Y50.00 E6.85
G1 F2549.40 X190.00 Y50.00 E5.99
G1 F2549.40 X190.00 Y150.00 E3.33

M117 S=43.29mm/s T=43.29mm/s
G0 F600.00 Z6.00
G1 F2597.59 X10.00 Y50.00 E6.85
G1 F2597.59 X190.00 Y50.00 E5.99
G1 F2597.59 X190.00 Y150.00 E3.33

M117 S=44.10mm/s T=44.10mm/s
G0 F600.00 Z6.20
G1 F2645.78 X10.00 Y50.00 E6.85
G1 F2645.78 X190.00 Y50.00 E5.99
G1 F2645.78 X190.00 Y150.00 E3.33

M117 S=44.90mm/s T=44.90mm/s
G0 F600.00 Z6.40
G1 F2693.98 X10.00 Y50.00 E6.85
G1 F2693.98 X190.00 Y50.00 E5.99
G1 F2693.98 X190.00 Y150.00 E3.33

M117 S=45.70mm/s T=45.70mm/s
G0 F600.00 Z6.60
G1 F2742.17 X10.00 Y50.00 E6.85
G1 F2742.17 X190.00 Y50.00 E5.99
G1 F2742.17 X190.00 Y150.00 E3.33

M117 S=46.51mm/s T=46.51mm/s
G0 F600.00 Z6.80
G1 F2790.36 X10.00 Y50.00 E6.85
G1 F2790.36 X190.00 Y50.00 E5.99
G1 F2790.36 X190.00 Y150.00 E3.33

M117 S=47.31mm/s T=47.31mm/s
G0 F600.00 Z7.00
G1 F2838.55 X10.00 Y50.00 E6.85
G1 F2838.55 X190.00 Y50.00 E5.99
G1 F2838.55 X190.00 Y150.00 E3.33

M117 S=48.11mm/s T=48.11mm/s
G0 F600.00 Z7.20
G1 F2886.75 X10.00 Y50.00 E6.85
G1 F2886.75 X190.00 Y50.00 E5.99
G1 F2886.75 X190.00 Y150.00 E3.33

M117 S=48.92mm/s T=48.92mm/s
G0 F600.00 Z7.40
G1 F2934.94 X10.00 Y50.00 E6.85
G1 F2934.94 X190.00 Y50.00 E5.99
G1 F2934.94 X190.00 Y150.00 E3.33

M117 S=49.72mm/s T=49.72mm/s
G0 F600.00 Z7.60
G1 F2983.13 X10.00 Y50.00 E6.85
G1 F2983.13 X190.00 Y50.00 E5.99
G1 F2983.13 X190.00 Y150.00 E3.33

M117 S=50.52mm/s T=50.52mm/s
G0 F600.00 Z7.80
G1 F3031.32 X10.00 Y50.00 E6.85
G1 F3031.32 X190.00 Y50.00 E5.99
G1 F3031.32 X190.00 Y150.00 E3.33

M117 S=51.33mm/s T=51.33mm/s
G0 F600.00 Z8.00
G1 F3079.52 X10.00 Y50.00 E6.85
G1 F3079.52 X190.00 Y50.00 E5.99
G1 F3079.52 X190.00 Y150.00 E3.33

M117 S=52.13mm/s T=52.13mm/s
G0 F600.00 Z8.20
G1 F3127.71 X10.00 Y50.00 E6.85
G1 F3127.71 X190.00 Y50.00 E5.99
G1 F3127.71 X190.00 Y150.00 E3.33

M117 S=52.93mm/s T=52.93mm/s
G0 F600.00 Z8.40
G1 F3175.90 X10.00 Y50.00 E6.85
G1 F3175.90 X190.00 Y50.00 E5.99
G1 F3175.90 X190.00 Y150.00 E3.33

M117 S=53.73mm/s T=53.73mm/s
G0 F600.00 Z8.60
G1 F3224.10 X10.00 Y50.00 E6.85
G1 F3224.10 X190.00 Y50.00 E5.99
G1 F3224.10 X190.00 Y150.00 E3.33

M117 S=54.54mm/s T=54.54mm/s
G0 F600.00 Z8.80
G1 F3272.29 X10.00 Y50.00 E6.85
G1 F3272.29 X190.00 Y50.00 E5.99
G1 F3272.29 X190.00 Y150.00 E3.33

M117 S=55.34mm/s T=55.34mm/s
G0 F600.00 Z9.00
G1 F3320.48 X10.00 Y50.00 E6.85
G1 F3320.48 X190.00 Y50.00 E5.99
G1 F3320.48 X190.00 Y150.00 E3.33

M117 S=56.14mm/s T=56.14mm/s
G0 F600.00 Z9.20
G1 F3368.67 X10.00 Y50.00 E6.85
G1 F3368.67 X190.00 Y50.00 E5.99
G1 F3368.67 X190.00 Y150.00 E3.33

M117 S=56.95mm/s T=56.95mm/s
G0 F600.00 Z9.40
G1 F3416.87 X10.00 Y50.00 E6.85
G1 F3416.87 X190.00 Y50.00 E5.99
G1 F3416.87 X190.00 Y150.00 E3.33

M117 S=57.75mm/s T=57.75mm/s
G0 F600.00 Z9.60
G1 F3465.06 X10.00 Y50.00 E6.85
G1 F3465.06 X190.00 Y50.00 E5.99
G1 F3465.06 X190.00 Y150.00 E3.33

M117 S=58.55mm/s T=58.55mm/s
G0 F600.00 Z9.80
G1 F3513.25 X10.00 Y50.00 E6.85
G1 F3513.25 X190.00 Y50.00 E5.99
G1 F3513.25 X190.00 Y150.00 E3.33

M117 S=59.36mm/s T=59.36mm/s
G0 F600.00 Z10.00
G1 F3561.44 X10.00 Y50.00 E6.85
G1 F3561.44 X190.00 Y50.00 E5.99
G1 F3561.44 X190.00 Y150.00 E3.33

M117 S=60.16mm/s T=60.16mm/s
G0 F600.00 Z10.20
G1 F3609.64 X10.00 Y50.00 E6.85
G1 F3609.64 X190.00 Y50.00 E5.99
G1 F3609.64 X190.00 Y150.00 E3.33

M117 S=60.96mm/s T=60.96mm/s
G0 F600.00 Z10.40
G1 F3657.83 X10.00 Y50.00 E6.85
G1 F3657.83 X190.00 Y50.00 E5.99
G1 F3657.83 X190.00 Y150.00 E3.33

M117 S=61.77mm/s T=61.77mm/s
G0 F600.00 Z10.60
G1 F3706.02 X10.00 Y50.00 E6.85
G1 F3706.02 X190.00 Y50.00 E5.99
G1 F3706.02 X190.00 Y150.00 E3.33

M117 S=62.57mm/s T=62.57mm/s
G0 F600.00 Z10.80
G1 F3754.22 X10.00 Y50.00 E6.85
G1 F3754.22 X190.00 Y50.00 E5.99
G1 F3754.22 X190.00 Y150.00 E3.33

M117 S=63.37mm/s T=63.37mm/s
G0 F600.00 Z11.00
G1 F3802.41 X10.00 Y50.00 E6.85
G1 F3802.41 X190.00 Y50.00 E5.99
G1 F3802.41 X190.00 Y150.00 E3.33

M117 S=64.18mm/s T=64.18mm/s
G0 F600.00 Z11.20
G1 F3850.60 X10.00 Y50.00 E6.85
G1 F3850.60 X190.00 Y50.00 E5.99
G1 F3850.60 X190.00 Y150.00 E3.33

M117 S=64.98mm/s T=64.98mm/s
G0 F600.00 Z11.40
G1 F3898.79 X10.00 Y50.00 E6.85
G1 F3898.79 X190.00 Y50.00 E5.99
G1 F3898.79 X190.00 Y150.00 E3.33

M117 S=65.78mm/s T=65.78mm/s
G0 F600.00 Z11.60
G1 F3946.99 X10.00 Y50.00 E6.85
G1 F3946.99 X190.00 Y50.00 E5.99
G1 F3946.99 X190.00 Y150.00 E3.33

M117 S=66.59mm/s T=66.59mm/s
G0 F600.00 Z11.80
G1 F3995.18 X10.00 Y50.00 E6.85
G1 F3995.18 X190.00 Y50.00 E5.99
G1 F3995.18 X190.00 Y150.00 E3.33

M117 S=67.39mm/s T=67.39mm/s
G0 F600.00 Z12.00
G1 F4043.37 X10.00 Y50.00 E6.85
G1 F4043.37 X190.00 Y50.00 E5.99
G1 F4043.37 X190.00 Y150.00 E3.33

M117 S=68.19mm/s T=68.19mm/s
G0 F600.00 Z12.20
G1 F4091.56 X10.00 Y50.00 E6.85
G1 F4091.56 X190.00 Y50.00 E5.99
G1 F4091.56 X190.00 Y150.00 E3.33

M117 S=69.00mm/s T=69.00mm/s
G0 F600.00 Z12.40
G1 F4139.76 X10.00 Y50.00 E6.85
G1 F4139.76 X190.00 Y50.00 E5.99
G1 F4139.76 X190.00 Y150.00 E3.33

M117 S=69.80mm/s T=69.80mm/s
G0 F600.00 Z12.60
G1 F4187.95 X10.00 Y50.00 E6.85
G1 F4187.95 X190.00 Y50.00 E5.99
G1 F4187.95 X190.00 Y150.00 E3.33

M117 S=70.60mm/s T=70.60mm/s
G0 F600.00 Z12.80
G1 F4236.14 X10.00 Y50.00 E6.85
G1 F4236.14 X190.00 Y50.00 E5.99
G1 F4236.14 X190.00 Y150.00 E3.33

M117 S=71.41mm/s T=71.41mm/s
G0 F600.00 Z13.00
G1 F4284.34 X10.00 Y50.00 E6.85
G1 F4284.34 X190.00 Y50.00 E5.99
G1 F4284.34 X190.00 Y150.00 E3.33

M117 S=72.21mm/s T=72.21mm/s
G0 F600.00 Z13.20
G1 F4332.53 X10.00 Y50.00 E6.85
G1 F4332.53 X190.00 Y50.00 E5.99
G1 F4332.53 X190.00 Y150.00 E3.33

M117 S=73.01mm/s T=73.01mm/s
G0 F600.00 Z13.40
G1 F4380.72 X10.00 Y50.00 E6.85
G1 F4380.72 X190.00 Y50.00 E5.99
G1 F4380.72 X190.00 Y150.00 E3.33

M117 S=73.82mm/s T=73.82mm/s
G0 F600.00 Z13.60
G1 F4428.91 X10.00 Y50.00 E6.85
G1 F4428.91 X190.00 Y50.00 E5.99
G1 F4428.91 X190.00 Y150.00 E3.33

M117 S=74.62mm/s T=74.62mm/s
G0 F600.00 Z13.80
G1 F4477.11 X10.00 Y50.00 E6.85
G1 F4477.11 X190.00 Y50.00 E5.99
G1 F4477.11 X190.00 Y150.00 E3.33

M117 S=75.42mm/s T=75.42mm/s
G0 F600.00 Z14.00
G1 F4525.30 X10.00 Y50.00 E6.85
G1 F4525.30 X190.00 Y50.00 E5.99
G1 F4525.30 X190.00 Y150.00 E3.33

M117 S=76.22mm/s T=76.22mm/s
G0 F600.00 Z14.20
G1 F4573.49 X10.00 Y50.00 E6.85
G1 F4573.49 X190.00 Y50.00 E5.99
G1 F4573.49 X190.00 Y150.00 E3.33

M117 S=77.03mm/s T=77.03mm/s
G0 F600.00 Z14.40
G1 F4621.68 X10.00 Y50.00 E6.85
G1 F4621.68 X190.00 Y50.00 E5.99
G1 F4621.68 X190.00 Y150.00 E3.33

M117 S=77.83mm/s T=77.83mm/s
G0 F600.00 Z14.60
G1 F4669.88 X10.00 Y50.00 E6.85
G1 F4669.88 X190.00 Y50.00 E5.99
G1 F4669.88 X190.00 Y150.00 E3.33

M117 S=78.63mm/s T=78.63mm/s
G0 F600.00 Z14.80
G1 F4718.07 X10.00 Y50.00 E6.85
G1 F4718.07 X190.00 Y50.00 E5.99
G1 F4718.07 X190.00 Y150.00 E3.33

M117 S=79.44mm/s T=79.44mm/s
G0 F600.00 Z15.00
G1 F4766.26 X10.00 Y50.00 E6.85
G1 F4766.26 X190.00 Y50.00 E5.99
G1 F4766.26 X190.00 Y150.00 E3.33

M117 S=80.24mm/s T=80.24mm/s
G0 F600.00 Z15.20
G1 F4814.46 X10.00 Y50.00 E6.85
G1 F4814.46 X190.00 Y50.00 E5.99
G1 F4814.46 X190.00 Y150.00 E3.33

M117 S=81.04mm/s T=81.04mm/s
G0 F600.00 Z15.40
G1 F4862.65 X10.00 Y50.00 E6.85
G1 F4862.65 X190.00 Y50.00 E5.99
G1 F4862.65 X190.00 Y150.00 E3.33

M117 S=81.85mm/s T=81.85mm/s
G0 F600.00 Z15.60
G1 F4910.84 X10.00 Y50.00 E6.85
G1 F4910.84 X190.00 Y50.00 E5.99
G1 F4910.84 X190.00 Y150.00 E3.33

M117 S=82.65mm/s T=82.65mm/s
G0 F600.00 Z15.80
G1 F4959.03 X10.00 Y50.00 E6.85
G1 F4959.03 X190.00 Y50.00 E5.99
G1 F4959.03 X190.00 Y150.00 E3.33

M117 S=83.45mm/s T=83.45mm/s
G0 F600.00 Z16.00
G1 F5007.23 X10.00 Y50.00 E6.85
G1 F5007.23 X190.00 Y50.00 E5.99
G1 F5007.23 X190.00 Y150.00 E3.33

M117 S=84.26mm/s T=84.26mm/s
G0 F600.00 Z16.20
G1 F5055.42 X10.00 Y50.00 E6.85
G1 F5055.42 X190.00 Y50.00 E5.99
G1 F5055.42 X190.00 Y150.00 E3.33

M117 S=85.06mm/s T=85.06mm/s
G0 F600.00 Z16.40
G1 F5103.61 X10.00 Y50.00 E6.85
G1 F5103.61 X190.00 Y50.00 E5.99
G1 F5103.61 X190.00 Y150.00 E3.33

M117 S=85.86mm/s T=85.86mm/s
G0 F600.00 Z16.60
G1 F5151.81 X10.00 Y50.00 E6.85
G1 F5151.81 X190.00 Y50.00 E5.99
G1 F5151.81 X190.00 Y150.00 E3.33

M117 S=86.67mm/s T=86.67mm/s
G0 F600.00 Z16.80
G1 F5200.00 X10.00 Y50.00 E6.85
G1 F5200.00 X190.00 Y50.00 E5.99
G1 F5200.00 X190.00 Y150.00 E3.33

M117 S=87.47mm/s T=87.47mm/s
G0 F600.00 Z17.00
G1 F5248.19 X10.00 Y50.00 E6.85
G1 F5248.19 X190.00 Y50.00 E5.99
G1 F5248.19 X190.00 Y150.00 E3.33

M117 S=88.27mm/s T=88.27mm/s
G0 F600.00 Z17.20
G1 F5296.38 X10.00 Y50.00 E6.85
G1 F5296.38 X190.00 Y50.00 E5.99
G1 F5296.38 X190.00 Y150.00 E3.33

M117 S=89.08mm/s T=89.08mm/s
G0 F600.00 Z17.40
G1 F5344.58 X10.00 Y50.00 E6.85
G1 F5344.58 X190.00 Y50.00 E5.99
G1 F5344.58 X190.00 Y150.00 E3.33

M117 S=89.88mm/s T=89.88mm/s
G0 F600.00 Z17.60
G1 F5392.77 X10.00 Y50.00 E6.85
G1 F5392.77 X190.00 Y50.00 E5.99
G1 F5392.77 X190.00 Y150.00 E3.33

M117 S=90.68mm/s T=90.68mm/s
G0 F600.00 Z17.80
G1 F5440.96 X10.00 Y50.00 E6.85
G1 F5440.96 X190.00 Y50.00 E5.99
G1 F5440.96 X190.00 Y150.00 E3.33

M117 S=91.49mm/s T=91.49mm/s
G0 F600.00 Z18.00
G1 F5489.16 X10.00 Y50.00 E6.85
G1 F5489.16 X190.00 Y50.00 E5.99
G1 F5489.16 X190.00 Y150.00 E3.33

M117 S=92.29mm/s T=92.29mm/s
G0 F600.00 Z18.20
G1 F5537.35 X10.00 Y50.00 E6.85
G1 F5537.35 X190.00 Y50.00 E5.99
G1 F5537.35 X190.00 Y150.00 E3.33

M117 S=93.09mm/s T=93.09mm/s
G0 F600.00 Z18.40
G1 F5585.54 X10.00 Y50.00 E6.85
G1 F5585.54 X190.00 Y50.00 E5.99
G1 F5585.54 X190.00 Y150.00 E3.33

M117 S=93.90mm/s T=93.90mm/s
G0 F600.00 Z18.60
G1 F5633.73 X10.00 Y50.00 E6.85
G1 F5633.73 X190.00 Y50.00 E5.99
G1 F5633.73 X190.00 Y150.00 E3.33

M117 S=94.70mm/s T=94.70mm/s
G0 F600.00 Z18.80
G1 F5681.93 X10.00 Y50.00 E6.85
G1 F5681.93 X190.00 Y50.00 E5.99
G1 F5681.93 X190.00 Y150.00 E3.33

M117 S=95.50mm/s T=95.50mm/s
G0 F600.00 Z19.00
G1 F5730.12 X10.00 Y50.00 E6.85
G1 F5730.12 X190.00 Y50.00 E5.99
G1 F5730.12 X190.00 Y150.00 E3.33

M117 S=96.31mm/s T=96.31mm/s
G0 F600.00 Z19.20
G1 F5778.31 X10.00 Y50.00 E6.85
G1 F5778.31 X190.00 Y50.00 E5.99
G1 F5778.31 X190.00 Y150.00 E3.33

M117 S=97.11mm/s T=97.11mm/s
G0 F600.00 Z19.40
G1 F5826.51 X10.00 Y50.00 E6.85
G1 F5826.51 X190.00 Y50.00 E5.99
G1 F5826.51 X190.00 Y150.00 E3.33

M117 S=97.91mm/s T=97.91mm/s
G0 F600.00 Z19.60
G1 F5874.70 X10.00 Y50.00 E6.85
G1 F5874.70 X190.00 Y50.00 E5.99
G1 F5874.70 X190.00 Y150.00 E3.33

M117 S=98.71mm/s T=98.71mm/s
G0 F600.00 Z19.80
G1 F5922.89 X10.00 Y50.00 E6.85
G1 F5922.89 X190.00 Y50.00 E5.99
G1 F5922.89 X190.00 Y150.00 E3.33

M117 S=99.52mm/s T=99.52mm/s
G0 F600.00 Z20.00
G1 F5971.09 X10.00 Y50.00 E6.85
G1 F5971.09 X190.00 Y50.00 E5.99
G1 F5971.09 X190.00 Y150.00 E3.33

M117 S=100.32mm/s T=100.32mm/s
G0 F600.00 Z20.20
G1 F6019.28 X10.00 Y50.00 E6.85
G1 F6019.28 X190.00 Y50.00 E5.99
G1 F6019.28 X190.00 Y150.00 E3.33

M117 S=101.12mm/s T=101.12mm/s
G0 F600.00 Z20.40
G1 F6067.47 X10.00 Y50.00 E6.85
G1 F6067.47 X190.00 Y50.00 E5.99
G1 F6067.47 X190.00 Y150.00 E3.33

M117 S=101.93mm/s T=101.93mm/s
G0 F600.00 Z20.60
G1 F6115.66 X10.00 Y50.00 E6.85
G1 F6115.66 X190.00 Y50.00 E5.99
G1 F6115.66 X190.00 Y150.00 E3.33

M117 S=102.73mm/s T=102.73mm/s
G0 F600.00 Z20.80
G1 F6163.86 X10.00 Y50.00 E6.85
G1 F6163.86 X190.00 Y50.00 E5.99
G1 F6163.86 X190.00 Y150.00 E3.33

M117 S=103.53mm/s T=103.53mm/s
G0 F600.00 Z21.00
G1 F6212.05 X10.00 Y50.00 E6.85
G1 F6212.05 X190.00 Y50.00 E5.99
G1 F6212.05 X190.00 Y150.00 E3.33

M117 S=104.34mm/s T=104.34mm/s
G0 F600.00 Z21.20
G1 F6260.24 X10.00 Y50.00 E6.85
G1 F6260.24 X190.00 Y50.00 E5.99
G1 F6260.24 X190.00 Y150.00 E3.33

M117 S=105.14mm/s T=105.14mm/s
G0 F600.00 Z21.40
G1 F6308.44 X10.00 Y50.00 E6.85
G1 F6308.44 X190.00 Y50.00 E5.99
G1 F6308.44 X190.00 Y150.00 E3.33

M117 S=105.94mm/s T=105.94mm/s
G0 F600.00 Z21.60
G1 F6356.63 X10.00 Y50.00 E6.85
G1 F6356.63 X190.00 Y50.00 E5.99
G1 F6356.63 X190.00 Y150.00 E3.33

M117 S=106.75mm/s T=106.75mm/s
G0 F600.00 Z21.80
G1 F6404.82 X10.00 Y50.00 E6.85
G1 F6404.82 X190.00 Y50.00 E5.99
G1 F6404.82 X190.00 Y150.00 E3.33

M117 S=107.55mm/s T=107.55mm/s
G0 F600.00 Z22.00
G1 F6453.01 X10.00 Y50.00 E6.85
G1 F6453.01 X190.00 Y50.00 E5.99
G1 F6453.01 X190.00 Y150.00 E3.33

M117 S=108.35mm/s T=108.35mm/s
G0 F600.00 Z22.20
G1 F6501.21 X10.00 Y50.00 E6.85
G1 F6501.21 X190.00 Y50.00 E5.99
G1 F6501.21 X190.00 Y150.00 E3.33

M117 S=109.16mm/s T=109.16mm/s
G0 F600.00 Z22.40
G1 F6549.40 X10.00 Y50.00 E6.85
G1 F6549.40 X190.00 Y50.00 E5.99
G1 F6549.40 X190.00 Y150.00 E3.33

M117 S=109.96mm/s T=109.96mm/s
G0 F600.00 Z22.60
G1 F6597.59 X10.00 Y50.00 E6.85
G1 F6597.59 X190.00 Y50.00 E5.99
G1 F6597.59 X190.00 Y150.00 E3.33

M117 S=110.76mm/s T=110.76mm/s
G0 F600.00 Z22.80
G1 F6645.79 X10.00 Y50.00 E6.85
G1 F6645.79 X190.00 Y50.00 E5.99
G1 F6645.79 X190.00 Y150.00 E3.33

M117 S=111.57mm/s T=111.57mm/s
G0 F600.00 Z23.00
G1 F6693.98 X10.00 Y50.00 E6.85
G1 F6693.98 X190.00 Y50.00 E5.99
G1 F6693.98 X190.00 Y150.00 E3.33

M117 S=112.37mm/s T=112.37mm/s
G0 F600.00 Z23.20
G1 F6742.17 X10.00 Y50.00 E6.85
G1 F6742.17 X190.00 Y50.00 E5.99
G1 F6742.17 X190.00 Y150.00 E3.33

M117 S=113.17mm/s T=113.17mm/s
G0 F600.00 Z23.40
G1 F6790.37 X10.00 Y50.00 E6.85
G1 F6790.37 X190.00 Y50.00 E5.99
G1 F6790.37 X190.00 Y150.00 E3.33

M117 S=113.98mm/s T=113.98mm/s
G0 F600.00 Z23.60
G1 F6838.56 X10.00 Y50.00 E6.85
G1 F6838.56 X190.00 Y50.00 E5.99
G1 F6838.56 X190.00 Y150.00 E3.33

M117 S=114.78mm/s T=114.78mm/s
G0 F600.00 Z23.80
G1 F6886.75 X10.00 Y50.00 E6.85
G1 F6886.75 X190.00 Y50.00 E5.99
G1 F6886.75 X190.00 Y150.00 E3.33

M117 S=115.58mm/s T=115.58mm/s
G0 F600.00 Z24.00
G1 F6934.94 X10.00 Y50.00 E6.85
G1 F6934.94 X190.00 Y50.00 E5.99
G1 F6934.94 X190.00 Y150.00 E3.33

M117 S=116.39mm/s T=116.39mm/s
G0 F600.00 Z24.20
G1 F6983.14 X10.00 Y50.00 E6.85
G1 F6983.14 X190.00 Y50.00 E5.99
G1 F6983.14 X190.00 Y150.00 E3.33

M117 S=117.19mm/s T=117.19mm/s
G0 F600.00 Z24.40
G1 F7031.33 X10.00 Y50.00 E6.85
G1 F7031.33 X190.00 Y50.00 E5.99
G1 F7031.33 X190.00 Y150.00 E3.33

M117 S=117.99mm/s T=117.99mm/s
G0 F600.00 Z24.60
G1 F7079.52 X10.00 Y50.00 E6.85
G1 F7079.52 X190.00 Y50.00 E5.99
G1 F7079.52 X190.00 Y150.00 E3.33

M117 S=118.80mm/s T=118.80mm/s
G0 F600.00 Z24.80
G1 F7127.72 X10.00 Y50.00 E6.85
G1 F7127.72 X190.00 Y50.00 E5.99
G1 F7127.72 X190.00 Y150.00 E3.33

M117 S=119.60mm/s T=119.60mm/s
G0 F600.00 Z25.00
G1 F7175.91 X10.00 Y50.00 E6.85
G1 F7175.91 X190.00 Y50.00 E5.99
G1 F7175.91 X190.00 Y150.00 E3.33

M117 S=120.40mm/s T=120.40mm/s
G0 F600.00 Z25.20
G1 F7224.10 X10.00 Y50.00 E6.85
G1 F7224.10 X190.00 Y50.00 E5.99
G1 F7224.10 X190.00 Y150.00 E3.33

M117 S=121.20mm/s T=121.20mm/s
G0 F600.00 Z25.40
G1 F7272.30 X10.00 Y50.00 E6.85
G1 F7272.30 X190.00 Y50.00 E5.99
G1 F7272.30 X190.00 Y150.00 E3.33

M117 S=122.01mm/s T=122.01mm/s
G0 F600.00 Z25.60
G1 F7320.49 X10.00 Y50.00 E6.85
G1 F7320.49 X190.00 Y50.00 E5.99
G1 F7320.49 X190.00 Y150.00 E3.33

M117 S=122.81mm/s T=122.81mm/s
G0 F600.00 Z25.80
G1 F7368.68 X10.00 Y50.00 E6.85
G1 F7368.68 X190.00 Y50.00 E5.99
G1 F7368.68 X190.00 Y150.00 E3.33

M117 S=123.61mm/s T=123.61mm/s
G0 F600.00 Z26.00
G1 F7416.87 X10.00 Y50.00 E6.85
G1 F7416.87 X190.00 Y50.00 E5.99
G1 F7416.87 X190.00 Y150.00 E3.33

M117 S=124.42mm/s T=124.42mm/s
G0 F600.00 Z26.20
G1 F7465.07 X10.00 Y50.00 E6.85
G1 F7465.07 X190.00 Y50.00 E5.99
G1 F7465.07 X190.00 Y150.00 E3.33

M117 S=125.22mm/s T=125.22mm/s
G0 F600.00 Z26.40
G1 F7513.26 X10.00 Y50.00 E6.85
G1 F7513.26 X190.00 Y50.00 E5.99
G1 F7513.26 X190.00 Y150.00 E3.33

M117 S=126.02mm/s T=126.02mm/s
G0 F600.00 Z26.60
G1 F7561.45 X10.00 Y50.00 E6.85
G1 F7561.45 X190.00 Y50.00 E5.99
G1 F7561.45 X190.00 Y150.00 E3.33

M117 S=126.83mm/s T=126.83mm/s
G0 F600.00 Z26.80
G1 F7609.65 X10.00 Y50.00 E6.85
G1 F7609.65 X190.00 Y50.00 E5.99
G1 F7609.65 X190.00 Y150.00 E3.33

M117 S=127.63mm/s T=127.63mm/s
G0 F600.00 Z27.00
G1 F7657.84 X10.00 Y50.00 E6.85
G1 F7657.84 X190.00 Y50.00 E5.99
G1 F7657.84 X190.00 Y150.00 E3.33

M117 S=128.43mm/s T=128.43mm/s
G0 F600.00 Z27.20
G1 F7706.03 X10.00 Y50.00 E6.85
G1 F7706.03 X190.00 Y50.00 E5.99
G1 F7706.03 X190.00 Y150.00 E3.33

M117 S=129.24mm/s T=129.24mm/s
G0 F600.00 Z27.40
G1 F7754.22 X10.00 Y50.00 E6.85
G1 F7754.22 X190.00 Y50.00 E5.99
G1 F7754.22 X190.00 Y150.00 E3.33

M117 S=130.04mm/s T=130.04mm/s
G0 F600.00 Z27.60
G1 F7802.42 X10.00 Y50.00 E6.85
G1 F7802.42 X190.00 Y50.00 E5.99
G1 F7802.42 X190.00 Y150.00 E3.33

M117 S=130.84mm/s T=130.84mm/s
G0 F600.00 Z27.80
G1 F7850.61 X10.00 Y50.00 E6.85
G1 F7850.61 X190.00 Y50.00 E5.99
G1 F7850.61 X190.00 Y150.00 E3.33

M117 S=131.65mm/s T=131.65mm/s
G0 F600.00 Z28.00
G1 F7898.80 X10.00 Y50.00 E6.85
G1 F7898.80 X190.00 Y50.00 E5.99
G1 F7898.80 X190.00 Y150.00 E3.33

M117 S=132.45mm/s T=132.45mm/s
G0 F600.00 Z28.20
G1 F7947.00 X10.00 Y50.00 E6.85
G1 F7947.00 X190.00 Y50.00 E5.99
G1 F7947.00 X190.00 Y150.00 E3.33

M117 S=133.25mm/s T=133.25mm/s
G0 F600.00 Z28.40
G1 F7995.19 X10.00 Y50.00 E6.85
G1 F7995.19 X190.00 Y50.00 E5.99
G1 F7995.19 X190.00 Y150.00 E3.33

M117 S=134.06mm/s T=134.06mm/s
G0 F600.00 Z28.60
G1 F8043.38 X10.00 Y50.00 E6.85
G1 F8043.38 X190.00 Y50.00 E5.99
G1 F8043.38 X190.00 Y150.00 E3.33

M117 S=134.86mm/s T=134.86mm/s
G0 F600.00 Z28.80
G1 F8091.58 X10.00 Y50.00 E6.85
G1 F8091.58 X190.00 Y50.00 E5.99
G1 F8091.58 X190.00 Y150.00 E3.33

M117 S=135.66mm/s T=135.66mm/s
G0 F600.00 Z29.00
G1 F8139.77 X10.00 Y50.00 E6.85
G1 F8139.77 X190.00 Y50.00 E5.99
G1 F8139.77 X190.00 Y150.00 E3.33

M117 S=136.47mm/s T=136.47mm/s
G0 F600.00 Z29.20
G1 F8187.96 X10.00 Y50.00 E6.85
G1 F8187.96 X190.00 Y50.00 E5.99
G1 F8187.96 X190.00 Y150.00 E3.33

M117 S=137.27mm/s T=137.27mm/s
G0 F600.00 Z29.40
G1 F8236.15 X10.00 Y50.00 E6.85
G1 F8236.15 X190.00 Y50.00 E5.99
G1 F8236.15 X190.00 Y150.00 E3.33

M117 S=138.07mm/s T=138.07mm/s
G0 F600.00 Z29.60
G1 F8284.35 X10.00 Y50.00 E6.85
G1 F8284.35 X190.00 Y50.00 E5.99
G1 F8284.35 X190.00 Y150.00 E3.33

M117 S=138.88mm/s T=138.88mm/s
G0 F600.00 Z29.80
G1 F8332.54 X10.00 Y50.00 E6.85
G1 F8332.54 X190.00 Y50.00 E5.99
G1 F8332.54 X190.00 Y150.00 E3.33

M117 S=139.68mm/s T=139.68mm/s
G0 F600.00 Z30.00
G1 F8380.73 X10.00 Y50.00 E6.85
G1 F8380.73 X190.00 Y50.00 E5.99
G1 F8380.73 X190.00 Y150.00 E3.33

M117 S=140.48mm/s T=140.48mm/s
G0 F600.00 Z30.20
G1 F8428.93 X10.00 Y50.00 E6.85
G1 F8428.93 X190.00 Y50.00 E5.99
G1 F8428.93 X190.00 Y150.00 E3.33

M117 S=141.29mm/s T=141.29mm/s
G0 F600.00 Z30.40
G1 F8477.12 X10.00 Y50.00 E6.85
G1 F8477.12 X190.00 Y50.00 E5.99
G1 F8477.12 X190.00 Y150.00 E3.33

M117 S=142.09mm/s T=142.09mm/s
G0 F600.00 Z30.60
G1 F8525.31 X10.00 Y50.00 E6.85
G1 F8525.31 X190.00 Y50.00 E5.99
G1 F8525.31 X190.00 Y150.00 E3.33

M117 S=142.89mm/s T=142.89mm/s
G0 F600.00 Z30.80
G1 F8573.51 X10.00 Y50.00 E6.85
G1 F8573.51 X190.00 Y50.00 E5.99
G1 F8573.51 X190.00 Y150.00 E3.33

M117 S=143.69mm/s T=143.69mm/s
G0 F600.00 Z31.00
G1 F8621.70 X10.00 Y50.00 E6.85
G1 F8621.70 X190.00 Y50.00 E5.99
G1 F8621.70 X190.00 Y150.00 E3.33

M117 S=144.50mm/s T=144.50mm/s
G0 F600.00 Z31.20
G1 F8669.89 X10.00 Y50.00 E6.85
G1 F8669.89 X190.00 Y50.00 E5.99
G1 F8669.89 X190.00 Y150.00 E3.33

M117 S=145.30mm/s T=145.30mm/s
G0 F600.00 Z31.40
G1 F8718.08 X10.00 Y50.00 E6.85
G1 F8718.08 X190.00 Y50.00 E5.99
G1 F8718.08 X190.00 Y150.00 E3.33

M117 S=146.10mm/s T=146.10mm/s
G0 F600.00 Z31.60
G1 F8766.28 X10.00 Y50.00 E6.85
G1 F8766.28 X190.00 Y50.00 E5.99
G1 F8766.28 X190.00 Y150.00 E3.33

M117 S=146.91mm/s T=146.91mm/s
G0 F600.00 Z31.80
G1 F8814.47 X10.00 Y50.00 E6.85
G1 F8814.47 X190.00 Y50.00 E5.99
G1 F8814.47 X190.00 Y150.00 E3.33

M117 S=147.71mm/s T=147.71mm/s
G0 F600.00 Z32.00
G1 F8862.66 X10.00 Y50.00 E6.85
G1 F8862.66 X190.00 Y50.00 E5.99
G1 F8862.66 X190.00 Y150.00 E3.33

M117 S=148.51mm/s T=148.51mm/s
G0 F600.00 Z32.20
G1 F8910.86 X10.00 Y50.00 E6.85
G1 F8910.86 X190.00 Y50.00 E5.99
G1 F8910.86 X190.00 Y150.00 E3.33

M117 S=149.32mm/s T=149.32mm/s
G0 F600.00 Z32.40
G1 F8959.05 X10.00 Y50.00 E6.85
G1 F8959.05 X190.00 Y50.00 E5.99
G1 F8959.05 X190.00 Y150.00 E3.33

M117 S=150.12mm/s T=150.12mm/s
G0 F600.00 Z32.60
G1 F9007.24 X10.00 Y50.00 E6.85
G1 F9007.24 X190.00 Y50.00 E5.99
G1 F9007.24 X190.00 Y150.00 E3.33

M117 S=150.92mm/s T=150.92mm/s
G0 F600.00 Z32.80
G1 F9055.43 X10.00 Y50.00 E6.85
G1 F9055.43 X190.00 Y50.00 E5.99
G1 F9055.43 X190.00 Y150.00 E3.33

M117 S=151.73mm/s T=151.73mm/s
G0 F600.00 Z33.00
G1 F9103.63 X10.00 Y50.00 E6.85
G1 F9103.63 X190.00 Y50.00 E5.99
G1 F9103.63 X190.00 Y150.00 E3.33

M117 S=152.53mm/s T=152.53mm/s
G0 F600.00 Z33.20
G1 F9151.82 X10.00 Y50.00 E6.85
G1 F9151.82 X190.00 Y50.00 E5.99
G1 F9151.82 X190.00 Y150.00 E3.33

M117 S=153.33mm/s T=153.33mm/s
G0 F600.00 Z33.40
G1 F9200.01 X10.00 Y50.00 E6.85
G1 F9200.01 X190.00 Y50.00 E5.99
G1 F9200.01 X190.00 Y150.00 E3.33

M117 S=154.14mm/s T=154.14mm/s
G0 F600.00 Z33.60
G1 F9248.21 X10.00 Y50.00 E6.85
G1 F9248.21 X190.00 Y50.00 E5.99
G1 F9248.21 X190.00 Y150.00 E3.33

M117 S=154.94mm/s T=154.94mm/s
G0 F600.00 Z33.80
G1 F9296.40 X10.00 Y50.00 E6.85
G1 F9296.40 X190.00 Y50.00 E5.99
G1 F9296.40 X190.00 Y150.00 E3.33

M117 S=155.74mm/s T=155.74mm/s
G0 F600.00 Z34.00
G1 F9344.59 X10.00 Y50.00 E6.85
G1 F9344.59 X190.00 Y50.00 E5.99
G1 F9344.59 X190.00 Y150.00 E3.33

M117 S=156.55mm/s T=156.55mm/s
G0 F600.00 Z34.20
G1 F9392.79 X10.00 Y50.00 E6.85
G1 F9392.79 X190.00 Y50.00 E5.99
G1 F9392.79 X190.00 Y150.00 E3.33

M117 S=157.35mm/s T=157.35mm/s
G0 F600.00 Z34.40
G1 F9440.98 X10.00 Y50.00 E6.85
G1 F9440.98 X190.00 Y50.00 E5.99
G1 F9440.98 X190.00 Y150.00 E3.33

M117 S=158.15mm/s T=158.15mm/s
G0 F600.00 Z34.60
G1 F9489.17 X10.00 Y50.00 E6.85
G1 F9489.17 X190.00 Y50.00 E5.99
G1 F9489.17 X190.00 Y150.00 E3.33

M117 S=158.96mm/s T=158.96mm/s
G0 F600.00 Z34.80
G1 F9537.36 X10.00 Y50.00 E6.85
G1 F9537.36 X190.00 Y50.00 E5.99
G1 F9537.36 X190.00 Y150.00 E3.33

M117 S=159.76mm/s T=159.76mm/s
G0 F600.00 Z35.00
G1 F9585.56 X10.00 Y50.00 E6.85
G1 F9585.56 X190.00 Y50.00 E5.99
G1 F9585.56 X190.00 Y150.00 E3.33

M117 S=160.56mm/s T=160.56mm/s
G0 F600.00 Z35.20
G1 F9633.75 X10.00 Y50.00 E6.85
G1 F9633.75 X190.00 Y50.00 E5.99
G1 F9633.75 X190.00 Y150.00 E3.33

M117 S=161.37mm/s T=161.37mm/s
G0 F600.00 Z35.40
G1 F9681.94 X10.00 Y50.00 E6.85
G1 F9681.94 X190.00 Y50.00 E5.99
G1 F9681.94 X190.00 Y150.00 E3.33

M117 S=162.17mm/s T=162.17mm/s
G0 F600.00 Z35.60
G1 F9730.14 X10.00 Y50.00 E6.85
G1 F9730.14 X190.00 Y50.00 E5.99
G1 F9730.14 X190.00 Y150.00 E3.33

M117 S=162.97mm/s T=162.97mm/s
G0 F600.00 Z35.80
G1 F9778.33 X10.00 Y50.00 E6.85
G1 F9778.33 X190.00 Y50.00 E5.99
G1 F9778.33 X190.00 Y150.00 E3.33

M117 S=163.78mm/s T=163.78mm/s
G0 F600.00 Z36.00
G1 F9826.52 X10.00 Y50.00 E6.85
G1 F9826.52 X190.00 Y50.00 E5.99
G1 F9826.52 X190.00 Y150.00 E3.33

M117 S=164.58mm/s T=164.58mm/s
G0 F600.00 Z36.20
G1 F9874.71 X10.00 Y50.00 E6.85
G1 F9874.71 X190.00 Y50.00 E5.99
G1 F9874.71 X190.00 Y150.00 E3.33

M117 S=165.38mm/s T=165.38mm/s
G0 F600.00 Z36.40
G1 F9922.91 X10.00 Y50.00 E6.85
G1 F9922.91 X190.00 Y50.00 E5.99
G1 F9922.91 X190.00 Y150.00 E3.33

M117 S=166.18mm/s T=166.18mm/s
G0 F600.00 Z36.60
G1 F9971.10 X10.00 Y50.00 E6.85
G1 F9971.10 X190.00 Y50.00 E5.99
G1 F9971.10 X190.00 Y150.00 E3.33

M117 S=166.99mm/s T=166.99mm/s
G0 F600.00 Z36.80
G1 F10019.29 X10.00 Y50.00 E6.85
G1 F10019.29 X190.00 Y50.00 E5.99
G1 F10019.29 X190.00 Y150.00 E3.33

M117 S=167.79mm/s T=167.79mm/s
G0 F600.00 Z37.00
G1 F10067.49 X10.00 Y50.00 E6.85
G1 F10067.49 X190.00 Y50.00 E5.99
G1 F10067.49 X190.00 Y150.00 E3.33

M117 S=168.59mm/s T=168.59mm/s
G0 F600.00 Z37.20
G1 F10115.68 X10.00 Y50.00 E6.85
G1 F10115.68 X190.00 Y50.00 E5.99
G1 F10115.68 X190.00 Y150.00 E3.33

M117 S=169.40mm/s T=169.40mm/s
G0 F600.00 Z37.40
G1 F10163.87 X10.00 Y50.00 E6.85
G1 F10163.87 X190.00 Y50.00 E5.99
G1 F10163.87 X190.00 Y150.00 E3.33

M117 S=170.20mm/s T=170.20mm/s
G0 F600.00 Z37.60
G1 F10212.06 X10.00 Y50.00 E6.85
G1 F10212.06 X190.00 Y50.00 E5.99
G1 F10212.06 X190.00 Y150.00 E3.33

M117 S=171.00mm/s T=171.00mm/s
G0 F600.00 Z37.80
G1 F10260.26 X10.00 Y50.00 E6.85
G1 F10260.26 X190.00 Y50.00 E5.99
G1 F10260.26 X190.00 Y150.00 E3.33

M117 S=171.81mm/s T=171.81mm/s
G0 F600.00 Z38.00
G1 F10308.45 X10.00 Y50.00 E6.85
G1 F10308.45 X190.00 Y50.00 E5.99
G1 F10308.45 X190.00 Y150.00 E3.33

M117 S=172.61mm/s T=172.61mm/s
G0 F600.00 Z38.20
G1 F10356.64 X10.00 Y50.00 E6.85
G1 F10356.64 X190.00 Y50.00 E5.99
G1 F10356.64 X190.00 Y150.00 E3.33

M117 S=173.41mm/s T=173.41mm/s
G0 F600.00 Z38.40
G1 F10404.84 X10.00 Y50.00 E6.85
G1 F10404.84 X190.00 Y50.00 E5.99
G1 F10404.84 X190.00 Y150.00 E3.33

M117 S=174.22mm/s T=174.22mm/s
G0 F600.00 Z38.60
G1 F10453.03 X10.00 Y50.00 E6.85
G1 F10453.03 X190.00 Y50.00 E5.99
G1 F10453.03 X190.00 Y150.00 E3.33

M117 S=175.02mm/s T=175.02mm/s
G0 F600.00 Z38.80
G1 F10501.22 X10.00 Y50.00 E6.85
G1 F10501.22 X190.00 Y50.00 E5.99
G1 F10501.22 X190.00 Y150.00 E3.33

M117 S=175.82mm/s T=175.82mm/s
G0 F600.00 Z39.00
G1 F10549.42 X10.00 Y50.00 E6.85
G1 F10549.42 X190.00 Y50.00 E5.99
G1 F10549.42 X190.00 Y150.00 E3.33

M117 S=176.63mm/s T=176.63mm/s
G0 F600.00 Z39.20
G1 F10597.61 X10.00 Y50.00 E6.85
G1 F10597.61 X190.00 Y50.00 E5.99
G1 F10597.61 X190.00 Y150.00 E3.33

M117 S=177.43mm/s T=177.43mm/s
G0 F600.00 Z39.40
G1 F10645.80 X10.00 Y50.00 E6.85
G1 F10645.80 X190.00 Y50.00 E5.99
G1 F10645.80 X190.00 Y150.00 E3.33

M117 S=178.23mm/s T=178.23mm/s
G0 F600.00 Z39.60
G1 F10693.99 X10.00 Y50.00 E6.85
G1 F10693.99 X190.00 Y50.00 E5.99
G1 F10693.99 X190.00 Y150.00 E3.33

M117 S=179.04mm/s T=179.04mm/s
G0 F600.00 Z39.80
G1 F10742.19 X10.00 Y50.00 E6.85
G1 F10742.19 X190.00 Y50.00 E5.99
G1 F10742.19 X190.00 Y150.00 E3.33

M117 S=179.84mm/s T=179.84mm/s
G0 F600.00 Z40.00
G1 F10790.38 X10.00 Y50.00 E6.85
G1 F10790.38 X190.00 Y50.00 E5.99
G1 F10790.38 X190.00 Y150.00 E3.33

M117 S=180.64mm/s T=180.64mm/s
G0 F600.00 Z40.20
G1 F10838.57 X10.00 Y50.00 E6.85
G1 F10838.57 X190.00 Y50.00 E5.99
G1 F10838.57 X190.00 Y150.00 E3.33

M117 S=181.45mm/s T=181.45mm/s
G0 F600.00 Z40.40
G1 F10886.77 X10.00 Y50.00 E6.85
G1 F10886.77 X190.00 Y50.00 E5.99
G1 F10886.77 X190.00 Y150.00 E3.33

M117 S=182.25mm/s T=182.25mm/s
G0 F600.00 Z40.60
G1 F10934.96 X10.00 Y50.00 E6.85
G1 F10934.96 X190.00 Y50.00 E5.99
G1 F10934.96 X190.00 Y150.00 E3.33

M117 S=183.05mm/s T=183.05mm/s
G0 F600.00 Z40.80
G1 F10983.15 X10.00 Y50.00 E6.85
G1 F10983.15 X190.00 Y50.00 E5.99
G1 F10983.15 X190.00 Y150.00 E3.33

M117 S=183.86mm/s T=183.86mm/s
G0 F600.00 Z41.00
G1 F11031.35 X10.00 Y50.00 E6.85
G1 F11031.35 X190.00 Y50.00 E5.99
G1 F11031.35 X190.00 Y150.00 E3.33

M117 S=184.66mm/s T=184.66mm/s
G0 F600.00 Z41.20
G1 F11079.54 X10.00 Y50.00 E6.85
G1 F11079.54 X190.00 Y50.00 E5.99
G1 F11079.54 X190.00 Y150.00 E3.33

M117 S=185.46mm/s T=185.46mm/s
G0 F600.00 Z41.40
G1 F11127.73 X10.00 Y50.00 E6.85
G1 F11127.73 X190.00 Y50.00 E5.99
G1 F11127.73 X190.00 Y150.00 E3.33

M117 S=186.27mm/s T=186.27mm/s
G0 F600.00 Z41.60
G1 F11175.92 X10.00 Y50.00 E6.85
G1 F11175.92 X190.00 Y50.00 E5.99
G1 F11175.92 X190.00 Y150.00 E3.33

M117 S=187.07mm/s T=187.07mm/s
G0 F600.00 Z41.80
G1 F11224.12 X10.00 Y50.00 E6.85
G1 F11224.12 X190.00 Y50.00 E5.99
G1 F11224.12 X190.00 Y150.00 E3.33

M117 S=187.87mm/s T=187.87mm/s
G0 F600.00 Z42.00
G1 F11272.31 X10.00 Y50.00 E6.85
G1 F11272.31 X190.00 Y50.00 E5.99
G1 F11272.31 X190.00 Y150.00 E3.33

M117 S=188.68mm/s T=188.68mm/s
G0 F600.00 Z42.20
G1 F11320.50 X10.00 Y50.00 E6.85
G1 F11320.50 X190.00 Y50.00 E5.99
G1 F11320.50 X190.00 Y150.00 E3.33

M117 S=189.48mm/s T=189.48mm/s
G0 F600.00 Z42.40
G1 F11368.70 X10.00 Y50.00 E6.85
G1 F11368.70 X190.00 Y50.00 E5.99
G1 F11368.70 X190.00 Y150.00 E3.33

M117 S=190.28mm/s T=190.28mm/s
G0 F600.00 Z42.60
G1 F11416.89 X10.00 Y50.00 E6.85
G1 F11416.89 X190.00 Y50.00 E5.99
G1 F11416.89 X190.00 Y150.00 E3.33

M117 S=191.08mm/s T=191.08mm/s
G0 F600.00 Z42.80
G1 F11465.08 X10.00 Y50.00 E6.85
G1 F11465.08 X190.00 Y50.00 E5.99
G1 F11465.08 X190.00 Y150.00 E3.33

M117 S=191.89mm/s T=191.89mm/s
G0 F600.00 Z43.00
G1 F11513.28 X10.00 Y50.00 E6.85
G1 F11513.28 X190.00 Y50.00 E5.99
G1 F11513.28 X190.00 Y150.00 E3.33

M117 S=192.69mm/s T=192.69mm/s
G0 F600.00 Z43.20
G1 F11561.47 X10.00 Y50.00 E6.85
G1 F11561.47 X190.00 Y50.00 E5.99
G1 F11561.47 X190.00 Y150.00 E3.33

M117 S=193.49mm/s T=193.49mm/s
G0 F600.00 Z43.40
G1 F11609.66 X10.00 Y50.00 E6.85
G1 F11609.66 X190.00 Y50.00 E5.99
G1 F11609.66 X190.00 Y150.00 E3.33

M117 S=194.30mm/s T=194.30mm/s
G0 F600.00 Z43.60
G1 F11657.85 X10.00 Y50.00 E6.85
G1 F11657.85 X190.00 Y50.00 E5.99
G1 F11657.85 X190.00 Y150.00 E3.33

M117 S=195.10mm/s T=195.10mm/s
G0 F600.00 Z43.80
G1 F11706.05 X10.00 Y50.00 E6.85
G1 F11706.05 X190.00 Y50.00 E5.99
G1 F11706.05 X190.00 Y150.00 E3.33

M117 S=195.90mm/s T=195.90mm/s
G0 F600.00 Z44.00
G1 F11754.24 X10.00 Y50.00 E6.85
G1 F11754.24 X190.00 Y50.00 E5.99
G1 F11754.24 X190.00 Y150.00 E3.33

M117 S=196.71mm/s T=196.71mm/s
G0 F600.00 Z44.20
G1 F11802.43 X10.00 Y50.00 E6.85
G1 F11802.43 X190.00 Y50.00 E5.99
G1 F11802.43 X190.00 Y150.00 E3.33

M117 S=197.51mm/s T=197.51mm/s
G0 F600.00 Z44.40
G1 F11850.63 X10.00 Y50.00 E6.85
G1 F11850.63 X190.00 Y50.00 E5.99
G1 F11850.63 X190.00 Y150.00 E3.33

M117 S=198.31mm/s T=198.31mm/s
G0 F600.00 Z44.60
G1 F11898.82 X10.00 Y50.00 E6.85
G1 F11898.82 X190.00 Y50.00 E5.99
G1 F11898.82 X190.00 Y150.00 E3.33

M117 S=199.12mm/s T=199.12mm/s
G0 F600.00 Z44.80
G1 F11947.01 X10.00 Y50.00 E6.85
G1 F11947.01 X190.00 Y50.00 E5.99
G1 F11947.01 X190.00 Y150.00 E3.33

M117 S=199.92mm/s T=199.92mm/s
G0 F600.00 Z45.00
G1 F11995.20 X10.00 Y50.00 E6.85
G1 F11995.20 X190.00 Y50.00 E5.99
G1 F11995.20 X190.00 Y150.00 E3.33

M117 S=200.72mm/s T=200.72mm/s
G0 F600.00 Z45.20
G1 F12043.40 X10.00 Y50.00 E6.85
G1 F12043.40 X190.00 Y50.00 E5.99
G1 F12043.40 X190.00 Y150.00 E3.33

M117 S=201.53mm/s T=201.53mm/s
G0 F600.00 Z45.40
G1 F12091.59 X10.00 Y50.00 E6.85
G1 F12091.59 X190.00 Y50.00 E5.99
G1 F12091.59 X190.00 Y150.00 E3.33

M117 S=202.33mm/s T=202.33mm/s
G0 F600.00 Z45.60
G1 F12139.78 X10.00 Y50.00 E6.85
G1 F12139.78 X190.00 Y50.00 E5.99
G1 F12139.78 X190.00 Y150.00 E3.33

M117 S=203.13mm/s T=203.13mm/s
G0 F600.00 Z45.80
G1 F12187.98 X10.00 Y50.00 E6.85
G1 F12187.98 X190.00 Y50.00 E5.99
G1 F12187.98 X190.00 Y150.00 E3.33

M117 S=203.94mm/s T=203.94mm/s
G0 F600.00 Z46.00
G1 F12236.17 X10.00 Y50.00 E6.85
G1 F12236.17 X190.00 Y50.00 E5.99
G1 F12236.17 X190.00 Y150.00 E3.33

M117 S=204.74mm/s T=204.74mm/s
G0 F600.00 Z46.20
G1 F12284.36 X10.00 Y50.00 E6.85
G1 F12284.36 X190.00 Y50.00 E5.99
G1 F12284.36 X190.00 Y150.00 E3.33

M117 S=205.54mm/s T=205.54mm/s
G0 F600.00 Z46.40
G1 F12332.56 X10.00 Y50.00 E6.85
G1 F12332.56 X190.00 Y50.00 E5.99
G1 F12332.56 X190.00 Y150.00 E3.33

M117 S=206.35mm/s T=206.35mm/s
G0 F600.00 Z46.60
G1 F12380.75 X10.00 Y50.00 E6.85
G1 F12380.75 X190.00 Y50.00 E5.99
G1 F12380.75 X190.00 Y150.00 E3.33

M117 S=207.15mm/s T=207.15mm/s
G0 F600.00 Z46.80
G1 F12428.94 X10.00 Y50.00 E6.85
G1 F12428.94 X190.00 Y50.00 E5.99
G1 F12428.94 X190.00 Y150.00 E3.33

M117 S=207.95mm/s T=207.95mm/s
G0 F600.00 Z47.00
G1 F12477.13 X10.00 Y50.00 E6.85
G1 F12477.13 X190.00 Y50.00 E5.99
G1 F12477.13 X190.00 Y150.00 E3.33

M117 S=208.76mm/s T=208.76mm/s
G0 F600.00 Z47.20
G1 F12525.33 X10.00 Y50.00 E6.85
G1 F12525.33 X190.00 Y50.00 E5.99
G1 F12525.33 X190.00 Y150.00 E3.33

M117 S=209.56mm/s T=209.56mm/s
G0 F600.00 Z47.40
G1 F12573.52 X10.00 Y50.00 E6.85
G1 F12573.52 X190.00 Y50.00 E5.99
G1 F12573.52 X190.00 Y150.00 E3.33

M117 S=210.36mm/s T=210.36mm/s
G0 F600.00 Z47.60
G1 F12621.71 X10.00 Y50.00 E6.85
G1 F12621.71 X190.00 Y50.00 E5.99
G1 F12621.71 X190.00 Y150.00 E3.33

M117 S=211.17mm/s T=211.17mm/s
G0 F600.00 Z47.80
G1 F12669.91 X10.00 Y50.00 E6.85
G1 F12669.91 X190.00 Y50.00 E5.99
G1 F12669.91 X190.00 Y150.00 E3.33

M117 S=211.97mm/s T=211.97mm/s
G0 F600.00 Z48.00
G1 F12718.10 X10.00 Y50.00 E6.85
G1 F12718.10 X190.00 Y50.00 E5.99
G1 F12718.10 X190.00 Y150.00 E3.33

M117 S=212.77mm/s T=212.77mm/s
G0 F600.00 Z48.20
G1 F12766.29 X10.00 Y50.00 E6.85
G1 F12766.29 X190.00 Y50.00 E5.99
G1 F12766.29 X190.00 Y150.00 E3.33

M117 S=213.57mm/s T=213.57mm/s
G0 F600.00 Z48.40
G1 F12814.49 X10.00 Y50.00 E6.85
G1 F12814.49 X190.00 Y50.00 E5.99
G1 F12814.49 X190.00 Y150.00 E3.33

M117 S=214.38mm/s T=214.38mm/s
G0 F600.00 Z48.60
G1 F12862.68 X10.00 Y50.00 E6.85
G1 F12862.68 X190.00 Y50.00 E5.99
G1 F12862.68 X190.00 Y150.00 E3.33

M117 S=215.18mm/s T=215.18mm/s
G0 F600.00 Z48.80
G1 F12910.87 X10.00 Y50.00 E6.85
G1 F12910.87 X190.00 Y50.00 E5.99
G1 F12910.87 X190.00 Y150.00 E3.33

M117 S=215.98mm/s T=215.98mm/s
G0 F600.00 Z49.00
G1 F12959.06 X10.00 Y50.00 E6.85
G1 F12959.06 X190.00 Y50.00 E5.99
G1 F12959.06 X190.00 Y150.00 E3.33

M117 S=216.79mm/s T=216.79mm/s
G0 F600.00 Z49.20
G1 F13007.26 X10.00 Y50.00 E6.85
G1 F13007.26 X190.00 Y50.00 E5.99
G1 F13007.26 X190.00 Y150.00 E3.33

M117 S=217.59mm/s T=217.59mm/s
G0 F600.00 Z49.40
G1 F13055.45 X10.00 Y50.00 E6.85
G1 F13055.45 X190.00 Y50.00 E5.99
G1 F13055.45 X190.00 Y150.00 E3.33

M117 S=218.39mm/s T=218.39mm/s
G0 F600.00 Z49.60
G1 F13103.64 X10.00 Y50.00 E6.85
G1 F13103.64 X190.00 Y50.00 E5.99
G1 F13103.64 X190.00 Y150.00 E3.33

M117 S=219.20mm/s T=219.20mm/s
G0 F600.00 Z49.80
G1 F13151.84 X10.00 Y50.00 E6.85
G1 F13151.84 X190.00 Y50.00 E5.99
G1 F13151.84 X190.00 Y150.00 E3.33

M117 S=220.00mm/s T=220.00mm/s
G0 F600.00 Z50.00
G1 F13200.03 X10.00 Y50.00 E6.85
G1 F13200.03 X190.00 Y50.00 E5.99
G1 F13200.03 X190.00 Y150.00 E3.33

G1 F1500.00 E-1.00
G91 ; Relative positioning
G0 F600.00 Z10.00
G90 ; Absolute positioning
G0 F13200.03 X0.00 Y200.00

M84 ; Disable all steppers
M106 S0 ; Turn-off fan
M104 S0 ; Turn-off hotend
M140 S0 ; Turn-off bed

; Total time = 1580.61 s = 26.34 min
; Total travel = 123989.95 mm = 123.99 m
; Total extruded length = 4115.66 mm = 4.12 m
