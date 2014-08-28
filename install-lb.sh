#!/bin/bash

function lb_install() {
	archive=liquibase-3.2.0-bin.tar.gz
	wget "http://sourceforge.net/projects/liquibase/files/Liquibase%20Core/liquibase-3.2.0-bin.tar.gz/download" -O $archive
	mkdir liquibase
	cd liquibase
	tar zxvf ../$archive
	rm ../$archive
	chmod +x liquibase
}

if [ ! -f "./liquibase/liquibase" ]; then
#	./liquibase/liquibase $@
#else
	lb_install
#	./liquibase/liquibase $@
else
	echo "Already installed!"
fi


