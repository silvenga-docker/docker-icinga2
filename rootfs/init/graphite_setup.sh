#
# Script to Configure the Graphite Support
#

CARBON_HOST=${CARBON_HOST:-""}
CARBON_PORT=${CARBON_PORT:-2003}


if ( [ -z ${CARBON_HOST} ] || [ -z ${CARBON_PORT} ] )
then
  echo " [i] no settings for graphite feature found"

  return
fi

configure_graphite() {

  enable_icinga_feature graphite

  if [ -e /etc/icinga2/features-enabled/graphite.conf ]
  then
    sed -i \
      -e "s|^.*\ //host\ =\ .*|  host\ =\ \"${CARBON_HOST}\"|g" \
      -e "s|^.*\ //port\ =\ .*|  port\ =\ \"${CARBON_PORT}\"|g" \
      /etc/icinga2/features-enabled/graphite.conf
  fi
}

configure_graphite
