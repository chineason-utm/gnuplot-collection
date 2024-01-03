reset session
#set term win enhanced size 640,720
#set key top right box
set title 'SPR curves in contact with gold'
set xlabel 'Incident angle (degrees)'
set ylabel 'Reflectance (a.u.)'
set xrange [50:56]
set yrange [0:1]
set sample 30000

array title[7]
title[1] = 'DW'
title[2] = '0.01uM'
title[3] = '1uM'
title[4] = '100uM'
title[5] = '1mM'
title[6] = '5mM'
title[7] = '10mM'

array file[7]
file[1] = 'DW'
file[2] = '001u'
file[3] = '1u'
file[4] = '100u'
file[5] = '1m'
file[6] = '5m'
file[7] = '10m'

getMin(x,y)		= sprintf("set table 'temp.dat';") .\
				  sprintf("plot 'C:\\Users\\ChinPC\\Documents\\cHIN eASON\\3intern\\spr run 4\\%s-%s.dat' sm cs;",x,y) .\
				  sprintf("unset table;") .\
				  sprintf("stats 'temp.dat' u 2 prefix 'Sm' nooutput;") .\
				  sprintf("FWHM = (Sm_max-Sm_min)/2;") .\
				  sprintf("plot 'temp.dat' u (abs($2-FWHM)/FWHM<2e-4 ? %s%s1 = $1 :NaN):2 every ::9999::19999 ;",x,y) .\
				  sprintf("plot 'temp.dat' u (abs($2-FWHM)/FWHM<2e-4 ? %s%s2 = $1 :NaN):2 every ::20000::29999;",x,y) .\
				  sprintf("print %s%s1, %s%s2, %s%s2-%s%s1;",x,y,x,y,x,y,x,y)
print 'gold'
do for[i=1:7] {
eval getMin('gold',file[i])
}
print 'cds'
do for[i=1:7] {
eval getMin('cds',file[i])
}

#plot 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 4\gold-dw.dat' u 1:2 smooth csplines, 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 3\gold-dw.dat' u 1:2 smooth csplines, 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 2\gold-dwerr.dat' u 1:2 smooth csplines   
#replot 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 3\gold-dw2.dat' u 1:3 smooth csplines  
#replot 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 3\gold-1uM.dat' u 1:3 smooth csplines  
#replot 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 3\gold-10uM.dat' u 1:3 smooth csplines
#replot 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 3\gold-100uM.dat' u 1:3 smooth csplines
#replot 'C:\Users\ChinPC\Documents\cHIN eASON\3intern\spr run 3\gold-1mM.dat' u 1:3 smooth csplines

