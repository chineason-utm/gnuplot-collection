unset multiplot
reset session
set term postscript eps color enhanced font "Arial,15" lw 1.5 size 9cm,6.75cm
set output 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\PL.eps'
set multiplot
set xlabel 'Wavelength (nm)'
set ylabel 'Normalised Intensity (a.u.)' 
set xrange [400:550]
set ytics out nomirror format "%.1f" scale 1 font ",12"
set xtics out nomirror scale 1 font ",12"
set mytics 2
set mxtics 2
set key box inside c r font ",12"

set yrange [0:1.2]

stats[0:900][0:10000] 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E0 (365).dat' nooutput
E0365t = STATS_max_y
stats[][0:10000] 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E3 (365).txt' nooutput
E3365t = STATS_max_y
stats[][0:10000] 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E2 (365).txt' nooutput
E2365t = STATS_max_y
stats[][0:10000] 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E1 (365).txt' nooutput
E1365t = STATS_max_y
plot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E0 (365).dat' u 1:($2/E0365t) w l lw 2 lc 1 title ' DI', 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E3 (365).txt' u 1:($2/E3365t) w l lw 2 lc 2 title ' 8h', 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E2 (365).txt' u 1:($2/E2365t) w l lw 2 lc 3 title ' 14h','C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E1 (365).txt' u 1:($2/E1365t) w l lw 2 lc 4 title ' 20h'

set lmargin at screen 0.6
set rmargin at screen 0.9
set tmargin at screen 0.95
set bmargin at screen 0.70
unset key
unset xlabel
unset ylabel

set xrange [437:441]
set yrange [0.999:1.0005]
set xtics 437,2,441
set ytics 0.001 format '%.3f'

plot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E3 (365).txt' u 1:($2/E3365t) sm csp lw 1.5 lc 2 notitle, 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E2 (365).txt' u 1:($2/E2365t) sm csp lw 1.5 lc 3 notitle, 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E1 (365).txt' u 1:($2/E1365t) sm csp lw 1.5 lc 4 notitle

unset multiplot
unset output

#set xrange [300:480]
#set autoscale y
#
#stats 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E1 (254).dat'
#E1254d = STATS_max_y
#stats 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E1 (254).nodat'
#E1254t = STATS_max_y
#plot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E1 (254).dat' u 1:($2/E1254d) w l lw 1.5
#replot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E1 (254).nodat' u 1:($2/E1254t) w l lw 1.5
#pause -1
#
#stats 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E2 (254).dat'
#E2254d = STATS_max_y
#stats 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E2 (254).txt'
#E2254t = STATS_max_y
#plot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E2 (254).dat' u 1:($2/E2254d) w l lw 1.5
#replot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E2 (254).txt' u 1:($2/E2254t) w l lw 1.5
#pause -1
#
#stats 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E3 (254).dat'
#E3254d = STATS_max_y
#stats 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E3 (254).nodat'
#E3254t = STATS_max_y
#plot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E3 (254).dat' u 1:($2/E3254d) w l lw 1.5
#replot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E3 (254).nodat' u 1:($2/E3254t) w l lw 1.5
#pause -1