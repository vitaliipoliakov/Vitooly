install: 
	install timecl time-server /usr/local/bin
	grep -q "46574" /etc/services || echo "time-server	46574/tcp" >> /etc/services
	install timeserver.xinetd /etc/xinetd.d/timeserver
	service xinetd restart
	msgfmt -o timecl-ru.mo timecl-ru.po
	install timecl-ru.mo /usr/share/locale/ru/LC_MESSAGES/timecl.mo
	msgfmt -o time-server-ru.mo time-server-ru.po
	install time-server-ru.mo /usr/share/locale/ru/LC_MESSAGES/time-server.mo
	locale-gen