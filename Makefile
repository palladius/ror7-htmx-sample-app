

dev:
	rails assets:precompile
	bin/dev


install-linux:
# needed by bin/dev to run multiprocesses at same time. ist a triphid process in fact (CSS + JS + RAILS)
	sudo apt-get install ruby-foreman
