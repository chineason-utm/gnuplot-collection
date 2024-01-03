# Checks "reality" and "model"... In other words expt vs theory.


pause -1 "Written in gnuplot 5.4. Set cd to this folder or it will not work!" # Remove this line when done
set title "Experiment-Theory Comparison"
set ylabel "Magnus Force, F_M (N)"
set xlabel "{/Symbol D}d = d_{EP} - d" offset 0,-0.45

set yrange [0:0.15]
set auto x
set style data histogram
set style histogram clustered errorbars lw 1.2 gap 1 title offset 0,-2.05 boxed
set style fill pattern 1 border -1
set xtics norotate nomirror offset 0,0.4
set key outside bottom center width 1.5 autotitle columnhead maxrows 1 offset 22,0
set bmargin 6.75

plot \
newhistogram "0mm" lt 6 fs pattern 9, 'Reality.dat' i 0 u 2:3:xtic(1) t col, '' i 0 u 4:5 t col, \
newhistogram "28mm" at 3.5 lt 6 fs pattern 9, '' i 1 u 2:3:xtic(1) notitle, '' i 1 u 4:5 notitle,  \
newhistogram "68mm" at 7 lt 6 fs pattern 9, '' i 2 u 2:3:xtic(1) notitle, '' i 2 u 4:5 notitle

set term pngcairo enhanced font "Times,10" size 640,480
set output "Compare.png"
replot
unset output
