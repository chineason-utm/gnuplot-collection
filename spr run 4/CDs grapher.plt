reset session
set term postscript eps color enhanced font "Arial,15" lw 1.5 size 9cm,6.75cm
set key bottom right box
set xlabel 'Incident angle ({/Symbol \260})' font ",11"
set ylabel 'Reflectance (a.u.)' font ",11"
set xrange [53:55]
set yrange [0:0.6]
set tics format "%.1f" font ",11"
set sample 10000

set output 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\1gold.eps'
plot 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\gold-dw.dat' u 1:2  smooth csplines     title 'DI', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\gold-001u.dat' u 1:2  smooth csplines title '0.01 {/Symbol m}M MP', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\gold-1u.dat' u 1:2  smooth csplines   title '1 {/Symbol m}M MP', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\gold-100u.dat' u 1:2  smooth csplines title '100 {/Symbol m}M MP', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\gold-1m.dat' u 1:2  smooth csplines   title '1 mM MP', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\gold-5m.dat' u 1:2  smooth csplines   title '5 mM MP', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\gold-10m.dat' u 1:2  smooth csplines  title '10 mM MP'
unset output

set output 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\1cds.eps'
plot 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\cds-dw.dat' u 1:2  smooth csplines title 'DI', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\cds-001u.dat' u 1:2  smooth csplines title '0.01 {/Symbol m}M MP', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\cds-1u.dat' u 1:2  smooth csplines title '1 {/Symbol m}M MP', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\cds-100u.dat' u 1:2  smooth csplines title '100 {/Symbol m}M MP', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\cds-1m.dat' u 1:2  smooth csplines title '1 mM MP', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\cds-5m.dat' u 1:2  smooth csplines title '5 mM MP', 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\cds-10m.dat' u 1:2  smooth csplines title '10 mM MP'
unset output
