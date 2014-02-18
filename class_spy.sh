#!/bin/sh

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
cd /Users/KeyLime503/Documents/Development/ClassSpy/

URL="http://www.registrar.ucla.edu/schedule/detselect.aspx?termsel=14S&subareasel=C%26EE+++&idxcrs=0180++++"
#URL="http://vafaikeontest.appspot.com/"
M_TITLE="Message from ClassSpy"
M_BODY="CEE 180 has changed status!"

M_NUM="4084660056"
M_MESSAGE="CEE 180 has changed status!"

wget -O page.txt $URL
md5 page.txt > last_md5
diff previous_md5 last_md5
if [ $? -ne 0 ] ; then 
	terminal-notifier -message "$M_BODY" -title "$M_TITLE"
	curl "http://textbelt.com/text" -d number=$M_NUM -d "message=$M_MESSAGE" 
fi
mv last_md5 previous_md5
rm page.txt