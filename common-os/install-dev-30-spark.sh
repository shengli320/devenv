#!/bin/bash

if [ `id -un` != "root" ]; then
    /bin/echo "[${0}] must be executed by root. Exit"
    exit 1
fi

SPARK_INSTALL_HOME=/home/plcm/progsw/spark
DEV_DOWNLOADS_DIR=/home/plcm/progsw/downloads
mkdir -p ${DEV_DOWNLOADS_DIR}
mkdir -p ${SPARK_INSTALL_HOME}


echo
echo "*********************************************************************"
echo "**** Install Spark"
printf "\n 1) download package\n"
pushd ${DEV_DOWNLOADS_DIR} >/dev/null
curl -O http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz

popd > /dev/null


pushd ${SPARK_INSTALL_HOME} >/dev/null
popd > /dev/null

exit 0
