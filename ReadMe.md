# Memcached Experimental Setup

----------

Sample application for demonstrating 'Memcached usage in real time.

1. You need to install 'Memcached service along with Apache and PHP .[Link https://websiteforstudents.com/install-memcached-on-ubuntu-18-04-16-04-with-apache2-and-php-7-2/ ]

2. I have used basic php for demonstration.

3. By default 'Memcached is configured with cache size of 64 MB. To-increase this size, you need to change 'memcached.conf' file.

4. Once done, to propagate changes, you need to restart the service

                  service memcached restart

5. I have written a script for generating dummy database (Key value)

                ./generate_kv.sh  kvdb.txt

6.Now, we will read this database and store in memcached server. To read database,

                  php write_to_memcache.php kvdb.txt

7. This will load data in cache. To view how many items have been loaded we can *telnet* to Memcached server and see statistics.

                  telnet 127.0.0.1 11211
                  stats


8. Now, lets verify by retrieving sone keys from memcache.
                  read_from_memcache.php
    This will o/p all the values if everything is done correctly.

You can see for 10GB database, you need to configure memcahed.conf accordingly. You can monitor memory usage using ‘htop’ command for larger cache.

