#!/bin/sh

wget -O page.txt "http://www.registrar.ucla.edu/schedule/detselect.aspx?termsel=14S&subareasel=ENGR+++&idxcrs=0185EW++"
md5 page.txt > previous_md5
rm page.txt

while [ 1 ]
do
	sleep 10
	wget -O page.txt "http://www.registrar.ucla.edu/schedule/detselect.aspx?termsel=14S&subareasel=ENGR+++&idxcrs=0185EW++"
	md5 page.txt > last_md5
	diff previous_md5 last_md5
	if [ "$?" = "!" ] ; then 
	      mail -s "185 is open brah!" keylime503@gmail.com
	fi
	mv last_md5 previous_md5
	rm page.txt
done