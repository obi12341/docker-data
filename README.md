Simpe Data Container for Docker
===========

This is a simple data-only container for Docker with SSH-server installed.

	docker run -d -e ROOT_PASS="yourpassword" -P obi12341/data


To make it is easy to use with other containers released following volumes:

	/var/www/
	/var/log/
	/var/lib/mysql/

