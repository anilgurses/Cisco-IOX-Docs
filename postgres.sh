pg_ctlcluster 11 main --start
pg_createcluster 11 main --start
chmod 1777 /tmp

su -c '/usr/lib/postgresql/9.3/bin/postgres -D /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf' postgres
chmod  700 /var/lib/postgresql/9.3/main
chown -R postgres /var/lib/postgresql/9.3/main
chown root:ssl-cert  /etc/ssl/private/ssl-cert-snakeoil.key
chmod 740 /etc/ssl/private/ssl-cert-snakeoil.key
chmod u+w /var/lib/postgresql/9.3/main/