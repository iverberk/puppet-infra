#!/bin/bash

# Close standard input so puppetdb doesn't hang on a password prompt when starting Jetty
exec 0>&-

/usr/bin/java -XX:OnOutOfMemoryError="kill -9 %p" -Xmx128m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/log/puppetdb/puppetdb-oom.hprof -Djava.security.egd=file:/dev/urandom -cp /usr/share/puppetdb/puppetdb.jar clojure.main -m com.puppetlabs.puppetdb.core services -c /etc/puppetdb/conf.d