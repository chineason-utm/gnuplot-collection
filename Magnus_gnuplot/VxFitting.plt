#fitting line to vx and calculating force from its derivative

pause -1 "Written in gnuplot 5.4. Set cd to this folder or it will not work!" # Remove this line when done

set term win enhanced size 640,480
set xzeroaxis
set key top left
set xrange [0:0.7]
set yrange [-1.2:1.2]
# errorvariables allow saving fit error results into (var)_err for error propagation calculations
set fit results limit 1e-7 errorvariables

# Automate title setting with a gnuplot function
title(x,y)	= sprintf("set title 'x-velocity ({/Symbol D}d=%d mm, Run %d)'",x,y)

set xlabel 'time, t (s)'
set ylabel 'v_x (m/s)'

# the line to fit to the curve
vxlin(x)	= M*x+Y_icpt
M_result	= ''

# stats function (gnuplot 5.0+?) finds value closest to 0
# second line is a "fake" plot command to tell gnuplot to scan all the data, outputting only selected ones around 0.
# the ? and : is from the ternary operator (if-else) also can be found in Java.
getMin(x,y) = sprintf("stats '%d-%d.dat' i 1 u (abs($5)) nooutput;",x,y) . \
sprintf("plot '' i 1 u ($0==STATS_index_min+3 ? T = $1 : NaN):5, '' i 1 u ($0==STATS_index_min+3 ? vy = $6 : NaN):5 ;")

#Fitting line +-5 points around closest to 0
# the every :::: is a useful way to select which datapoints to use
fit(x,y)	= sprintf("fit vxlin(x) '%d-%d.dat' i 1 u 1:5 every ::STATS_index_min-2::STATS_index_min+8 via M,Y_icpt;",x,y) . \
sprintf("M_result = M_result.sprintf('%f %f %f	',vy,M,M_err);")

#------plot function--------
plot(x) = sprintf("plot '' i 1 u 1:5 w p title 'v_x', vxlin(x) lw 2 lc 4 title sprintf('v_x(t=%.3f) = %.3fx %.3f',T,M,Y_icpt), \\
keyentry t sprintf('a_x = %.3f \\261 %.3f',M,M_err)")

#------export to file-------
save(x,y)	= sprintf("set term pngcairo enhanced font 'Times,10' size 640,480;") . \
			  sprintf("set output 'Force%d-%d.png';",x,y) . \
			  sprintf("replot;") . \
			  sprintf("pause 1;") . \
			  sprintf("unset output;") . \
			  sprintf("set term win enhanced size 640,480;")

#Actual process
do for [i=1:3] {
eval title(0,i)
eval getMin(0,i)
eval fit(0,i)
eval plot(0)
eval save(0,i)
#pause -1
}

do for [i=1:3] {
eval title(28,i)
eval getMin(28,i)
eval fit(28,i)
eval plot(0)
eval save(28,i)
#pause -1
}

do for [i=1:2] {
eval title(68,i)
eval getMin(68,i)
eval fit(68,i)
eval plot(0)
eval save(68,i)
#pause -1
}

print M_result