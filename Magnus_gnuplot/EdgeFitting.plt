#sin-cos multi-branch fitting, automated
# multi-branch fitting is a way to fit two related functions at the same time.
# the reason I use this is because I have x(t) and y(t) in circular motion, both should have the same radius and frequency. So you can think of the trajectory as a helix. But there is no 3D function fitting.

pause -1 "Written in gnuplot 5.4. Set cd to this folder or it will not work!" # Remove this line when done
set xrange [0:0.7]
set yrange [-7:7]
title(x,y)	= sprintf("set title 'Edge coordinate relative to center ({/Symbol D}d=%d mm, Run %d)'",x,y)

set xlabel 'time, t (s)'
set ylabel 'distance (cm)'

# the way to do multibranch fit is to make a new function that is the if-else of 2 functions.
theta(x)	= w*x + phi
X(x)		= r*cos(theta(x))
Y(x)		= r*sin(theta(x))
Rot(x,y)	= (y==0) ? X(x) : Y(x)

getnum(x,y,col) = sprintf("stats '%d-%d.dat' u %d every ::0::0 nooutput",x,y,col)

# calculates phase since it interferes with fit
initParams(x,y)	= sprintf("eval getnum(%d,%d,5);",x,y) . \
				  sprintf("x0 = STATS_min;") . \
				  sprintf("eval getnum(%d,%d,6);",x,y) . \
				  sprintf("y0 = STATS_min;") . \
				  sprintf("r = 3.5;") . \
				  sprintf("w = 23;") . \
				  sprintf("phi = x0<0 && y0<0 ? atan(y0/x0)+pi: atan(y0/x0);")

set fit errorvariables

# for multibranch fitting, u (datablock index):-1:(first data):(second data) is needed. Refer help page
fit(x)	= sprintf("fit[0:0.4] Rot(x,y) '' i 0  u 1:-1:5:6 via r,w")

# keyentry means put words in legend
plot(x) = sprintf("plot '' i 0 u 1:5:($5*((3.5/sqrt($5**2+$6**2))-1)) w errorbars title 'x = r cos({/Symbol w}t+{/Symbol f})', \\
'' i 0 u 1:6:($6*((3.5/sqrt($5**2+$6**2))-1)) w errorbars title 'y = r sin({/Symbol w}t+{/Symbol f})', \\
X(x) notitle, Y(x) notitle, \\
keyentry t sprintf('r = %.2f',r), \\
keyentry t sprintf('{/Symbol w = %.3f \\261 %.3f}',w,w_err), \\
keyentry t sprintf('{/Symbol f = %.3f}',phi)")

do for [i=1:3] {
eval title(0,i)
eval initParams(0,i)
print phi
eval fit(0)
eval plot(0)
pause -1
}

do for [i=1:3] {
eval title(28,i)
eval initParams(28,i)
print phi
eval fit(0)
eval plot(0)
pause -1
}

do for [i=1:2] {
eval title(68,i)
eval initParams(68,i)
print phi
eval fit(0)
eval plot(0)
pause -1
}