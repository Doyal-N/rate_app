resque:
	rake resque:work QUEUE=*

foreman:
	foreman start -f Procfile.dev
