Nag_checks
==========

Nagios Checks

My git hub repository is here: https://github.com/hugme/Nag_checks

These are some of the nagios checks I've built over the years. I'll be adding to here as I write more.

check_iscsi - great for checking your iscsi connections to make sure they're up

check_linux_memory - a fast and low resource memory check with performance graphing and some nice
	argments to change the way it looks over your memory. The -f is now the default. You can turn it off
	by using -n which will go back to the old method.

check_linux_net - a very extendable network monitoring tool. There are tons of arguments you can use
	to have this do anything you want. It's very low resource and has performance monitoring.

check_linux_route - a tool for checking routes on the system. Very nice to use in conjunction with
	an automation software. I used it mainly for checking the routes on my SAN network to
	make sure they were up and correct.
