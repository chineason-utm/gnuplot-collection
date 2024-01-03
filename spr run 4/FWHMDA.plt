reset session
set term postscript eps color enhanced font "Arial,15" lw 1.5 size 9cm,6.75cm
unset key
set border 1+2 lt 1
set y2tics 0.55, 0.01, 0.61 out font ",11" textcolor rgb "#377EB8" format "%.2f"
set ytics 1.64, 0.02, 1.82 nomirror format "%.2f"
set xlabel 'Concentration ({/Symbol \155}M)' textcolor rgb "red"
set ylabel 'FWHM ({/Symbol \260})' textcolor rgb "red"
set y2label 'Detection Accuracy, DA ({/Symbol \260}^{-1})' textcolor rgb "#377EB8"
set arrow 1 from -1000, 1.82 to 11000, 1.82 nohead lt 2
set arrow 2 from 11000,  1.64 to 11000, 1.82 nohead lt 2
set xrange [-1000:11000]
set yrange [1.64:1.82]
set y2range [0.55:0.61]

set output 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\1fwhmda.eps'
plot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\shift.dat' i 1 u 1:3 w lp lt 1 lw 2, '' i 1 u 1:4 w lp lt 2 lw 2 axis x1y2 
unset output