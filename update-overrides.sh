#!/bin/sh

ZIP='overrides.zip'
cd overrides
zip -r ../${ZIP} *
cd ..
MD5=`md5sum ${ZIP} | awk '{print $1}'`

sed -i.bak 's#<MD5>.*</MD5> <!-- auto:overrides.zip#<MD5>'${MD5}'</MD5> <!-- auto:overrides.zip#' ServerPack.xml

diff ServerPack.xml.bak ServerPack.xml

