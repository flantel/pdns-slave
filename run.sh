#!/bin/bash

# Check that the environment variables have been set, otherwise exit
if [ "$SUPERMASTER_IP." = "." ] || [ "$SLAVE_DNSNAME." = "." ] ; then
	echo "No SUPERMASTER_IP or no SLAVE_DNSNAME defined!"
	exit 1
fi

# Insert the Supermaster details into the sqlite3 db

/usr/bin/sqlite3  /var/lib/powerdns/pdns.sqlite3  "INSERT INTO supermasters (ip, nameserver, account) VALUES ('$SUPERMASTER_IP', '$SLAVE_DNSNAME', 'internal');"

# Start the server - the config file already trells it to act as a slave.
# and stay in the foreground.

/usr/sbin/pdns_server

