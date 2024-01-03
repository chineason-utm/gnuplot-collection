reset session
set xrange [400:600]

array title[3]
title[1] = '20h'
title[2] = '14h'
title[3] = '8h'

#Normalise: get max value from col 2
getMax(x,y) = sprintf("stats 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E%d (%d).dat';",x,y) .\
sprintf("E%d%d = STATS_max_y;",x,y)
plot(x,y) = sprintf("replot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E%d (%d).dat' u 1:($2/E%d%d) w l ",x,y,x,y)

eval getMax(0,365)
plot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E0 (365).dat' u 1:($2/E0365) w l title 'Water (365)'

do for [i=1:3] {
eval getMax(i,365)
eval plot(i,365)
}

set yrange [:1.3]
replot
pause -1

set autoscale y
set xrange [300:500]
eval getMax(0,254)
plot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\pl\\E0 (254).dat' u 1:($2/E0254) w l title 'Water (254)'

do for [i=1:3] {
eval getMax(i,254)
eval plot(i,254)
}

set yrange [:1.3]
replot
pause -1