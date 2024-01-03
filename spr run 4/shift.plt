reset session
set term postscript eps color enhanced font "Arial,15" lw 1.5 size 9cm,6.75cm
set xlabel "MP concentration (M)"
set ylabel "{/Symbol \104\161 (\260)}" 

set sample 24000

y(x) = M*log10(x)+B
fit y(x) 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\shift.dat' i 1 every ::1::6 via M,B 
pr M, B

mean(x)= mean
fit mean(x) 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\shift.dat' i 1 via mean
SST = FIT_WSSR/(FIT_NDF+1)

N(x) = (1-0.01)/pi*(atan(x)+pi/2)+0.01
z(x) = (A*(K*x)**N(n))/(1+(K*x)**N(n))
fit z(x) 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\shift.dat' i 1 via A,K,n
SSE=FIT_WSSR/(FIT_NDF)
SSR=SST-SSE
R2=SSR/SST
pr A, K, N(n), R2

set table $Data
plot[0:1.1e-2] z(x)
unset table
pause -1

set mytics 2
set mxtics 10
set key box inside b r font ",12"
set logscale x
set xtics format "10^{%L}" scale 1 font ",12"
set ytics out nomirror format "%.2f" 
set xrange [1e-9:1.2e-2]
set yrange [0:0.12]
set output 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\1shifts.eps'
set label sprintf("{/Symbol \104\161} = %.5f lg [MP] + %.5f",M,B) at screen 0.5,0.45 font ",11.5"
set label "R^2 = 0.9317" at screen 0.5,0.4 font ",11.5"
plot  'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\shift.dat' i 1 lt 2 lw 2 t 'Experimental Data', y(x) lt 1 lw 2 t 'Fitting data'

unset output
unset label
unset logscale x
set xtics format "%2.0t{/Symbol \264}10^{%L}"
set mxtics 2
set xrange [-1e-3:1.1e-2]
set yrange [-0.02:0.12]

set output 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\1sips.eps'
set label "{/Symbol Dq}_{max} = 0.11184{/Symbol \260}" at screen 0.6, 0.6
set label "K = 4.9346{/Symbol \264}10^6 M^{-1}" at screen 0.6, 0.55
set label "n = 0.2634" at screen 0.6, 0.5
set label "R^2 = 0.9582" at screen 0.6, 0.45
plot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\shift.dat' i 1 lt 2 lw 2 t 'Experimental Data', $Data w l lt 1 lw 2 t 'Sips model'

unset output