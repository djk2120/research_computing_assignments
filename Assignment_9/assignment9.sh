#/bin/bash
# Daniel Kennedy - djk2120@columbia.edu
# Nov 9, 2017

gmt makecpt -Ctopo -T-7000/7000/500 -Z > t.cpt
#gmt grdgradient us.nc -Ne0.8 -A100 -fg -Gus_i.nc
#gmt grdimage -R-170/-65/22/72 us_i.nc -Ius.nc -JM6i -P -Ba -Ct.cpt -K > USArray.ps

gmt grdgradient us.nc -Ne0.8 -A100 -fg -Gus_i.nc
gmt grdimage us.nc -Ius_i.nc -JM6i -P -Ba -Ct.cpt > USArray.ps

#gmt psscale -DjTC+w5i/0.25i+h+o0/-1i -R -J -Ct.cpt -I0.4 -Bx1500 -By+lm -O  -K  -P >> USArray.ps
#gmt pscoast -R-170/-65/22/72 -JM6i -Ba -W -Di -N1/1p -N2/0.3p -O -K -P >> USArray.ps

#gmt pscoast -R -J -Dh -B0.5 -Ia -Na/5/0/205/96 -Lf-104.5/41/39/100 -S168/255/255 -W3 -K -O >> USArray.ps
#gmt pscoast -R-170/-65/20/72 -JM6i -P -Ba -Gchocolate >> USArray.ps

cut -f 5 _US-TA-StationList.txt > lat.txt
cut -f 6 _US-TA-StationList.txt > lon.txt
cut -f 8 _US-TA-StationList.txt | cut -c 1,2,3,4 > year.txt
paste lon.txt lat.txt > tmp
paste tmp year.txt > stations.txt

y1=`tail -n +2 year.txt | sort | head -n 1`
y2=`tail -n +2 year.txt | sort | tail -n 1`

#gmt makecpt -Cno_green -T$y1/$y2/1 > yrs.cpt
#gmt psxy stations.txt -R -J -W -Sc0.1c -Cyrs.cpt -O -K -P >> USArray.ps
#gmt psscale -DjMR+o-3c/0 -R -J -Cyrs.cpt -I0.4 -By+lm -O >> USArray.ps

gmt psconvert USArray.ps -Tf