reset session
set term postscript eps color enhanced font "Arial,15" lw 1.5 size 9cm,6.75cm

set xlabel "Wavelength, {/Symbol l} (nm)"
set ylabel "Absorbance, A (a.u.)"
set xtic format "%.0f"
set ytic format "%.1f"
set xrange [200:800]
set yrange [0:4]
set nokey
set output 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\uvvis\\1abs.eps'

plot 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\uvvis\e1.dat' u 1:2 w l lw 2
unset output
pause -1

set xtic format "%g"
set ytic format "%g"
set xlabel "h{/Symbol n} (eV)" 
set ylabel "({/Symbol a}h{/Symbol n})^2 ({/Symbol \264}10^6 m^{-2} eV^2)"

set xrange [2:4]
set yrange [0:9e6]

set sample 20000

h = 6.62606876e-34
c = 299792458
e = 1.602e-19

set table $Data
plot[2:4] 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\uvvis\e1.dat' u (h*c/($1*1e-9*e)):((2.303*$2/0.01)*h*c/($1*1e-9*e))**2
unset table

stats $Data u 1:2 every ::45::68

set xtic format "%.1f"
set ytic format "%1.1t"
set output 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\uvvis\\1tauc.eps'
Eg = -STATS_intercept/STATS_slope

set label sprintf("E_g = %.3f eV",Eg) at screen 0.5, 0.3 
plot 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\uvvis\e1.dat' u (h*c/($1*1e-9*e)):((2.303*$2/0.01)*h*c/($1*1e-9*e))**2 w p lt 2 pt 7 ps 0.5, STATS_slope*x+STATS_intercept lt 1 lw 2

unset output