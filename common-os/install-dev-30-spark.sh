#!/bin/bash

FORCE_REINSTALL=1
PROGSW_HOME=${HOME}/progsw
PROGSW_DOWNLOADS_DIR=${PROGSW_HOME}/downloads
mkdir -p ${PROGSW_DOWNLOADS_DIR}

echo
echo "*********************************************************************"
echo "**** Install Spark"
printf " 1) download package\n"
pushd ${PROGSW_DOWNLOADS_DIR} >/dev/null
if [ ! -e ${PROGSW_DOWNLOADS_DIR}/spark-2.1.0-bin-hadoop2.7.tgz ]; then
  curl -O http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz
else
  echo "  already downloaded."
fi

popd > /dev/null

printf " 2) install package\n"
pushd ${PROGSW_HOME} >/dev/null

if [ "${FORCE_REINSTALL}" == "1" ]; then
  rm -rf "${PROGSW_HOME}/spark"
fi

if [ -d "${PROGSW_HOME}/spark" ]; then
  echo "  Spark already installed."
else
  tar -zxf ${PROGSW_DOWNLOADS_DIR}/spark-2.1.0-bin-hadoop2.7.tgz -C ${PROGSW_HOME}
  mv ${PROGSW_HOME}/spark-2.1.0-bin-hadoop2.7 ${PROGSW_HOME}/spark
  echo "  Installed to: ${PROGSW_HOME}/spark"
fi

popd > /dev/null

echo
echo "*********************************************************************"
echo "**** Manual Steps: Spark"
echo '  - 1) update ~/.profile'
echo '       SPARK_HOME=$HOME/progsw/spark'
echo '       PATH="${SPARK_HOME}/bin:$PATH"'



echo
exit 0
