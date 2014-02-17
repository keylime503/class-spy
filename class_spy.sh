#!/bin/sh

#URL="http://www.registrar.ucla.edu/schedule/detselect.aspx?termsel=14S&subareasel=C%26EE+++&idxcrs=0180++++"
URL="http://vafaikeontest.appspot.com/"
M_TITLE="Message from ClassSpy"
#M_BODY="C&EE 180 is now open!"
M_BODY="Did it work?"

wget -O page.txt $URL
md5 page.txt > previous_md5
rm page.txt

while [ 1 ]
do
	sleep 10
	wget -O page.txt $URL
	md5 page.txt > last_md5
	diff previous_md5 last_md5
	if [ $? -ne 0 ] ; then 
		terminal-notifier -message $M_BODY -title $M_TITLE
	fi
	mv last_md5 previous_md5
	rm page.txt
done
