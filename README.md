# Important Note
Most (intern) data files in the scripts are linked by **absolute file paths**. They will **Not** work for your computer. Please change them to the path in your computer.

`Where do I find the absolute file path?`

The simple way I use: Drag any non-plt file in the directory into gnuplot (This is the same as `load "xxx.plt"` but spits an error) and in the error message the full file path is shown. You can then copy that.

`I let the filepath be "xxx.dat" then changed the directory with cd and it still wont work!`

This is due to the `reset session` being run firstmost in my codes. You need to edit `gnuplot.ini` and remove the `cd` in it 


# Useful links
[gnuplot demos page](http://www.gnuplot.info/demo_5.5/)

[gnuplot tricks](http://gnuplot-tricks.blogspot.com/)

[ඞ](https://www.youtube.com/@chineason/videos)
