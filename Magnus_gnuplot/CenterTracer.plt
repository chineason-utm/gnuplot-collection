# Plots center spot for all runs, with gnuplot multiplot

pause -1 "Written in gnuplot 5.4. Set cd to this folder or it will not work!" # Remove this line when done

set term pngcairo enhanced font "Times,10" size 640,480
set output "Coords.png"
set multiplot layout 1,3 title "Trajectory of centre spot of cylinders" offset 0,-0.6
set tmargin at screen 0.90
set lmargin at screen 0.1
set rmargin at screen 0.35
set yzeroaxis
set xrange [-0.25:0.25]
set yrange [-1.20:0.20]
unset key

# Gnuplot accepts code as a function. If you combine with sprintf you can sub in different numbers
plot(x) = sprintf("plot '%d-1.dat' i 1 u ($3/100):($4/100) w l lw 1.5 t '1', '%d-2.dat' i 1 u ($3/100):($4/100) w l lw 1.5 t '2',  '%d-3.dat' i 1 u ($3/100):($4/100) w l lw 1.5 t '3'",x,x,x)

set ylabel "y, m"
set xlabel "x, m ({/Symbol D}d_{EP}=0mm)"

# eval means "calculate" the function (code) 
eval plot(0)
set lmargin at screen 0.35
set rmargin at screen 0.60
set xlabel "x, m ({/Symbol D}d_{EP}=28mm)"
unset ytics
unset ylabel
eval plot(28)
set lmargin at screen 0.60
set rmargin at screen 0.85
set key center rmargin nobox offset -1,0 title "Run" offset -4,0
set xlabel "x, m ({/Symbol D}d_{EP}=68mm)"
eval plot(68)

unset multiplot
unset output
