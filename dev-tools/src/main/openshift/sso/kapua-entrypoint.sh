#!/bin/bash

set -e

if [ ! -f /opt/jboss/keycloak/standalone/data/first-run ]; then
  echo "Initializing Kapua setup ..."
  echo "   Kapua Console: $KAPUA_CONSOLE_URL"

  /opt/jboss/docker-entrypoint.sh -b localhost &

  while ! curl -sf http://localhost:8080/auth; do
    echo Waiting for keycloak to come up ...
    sleep 5
  done

  echo Keycloak is up

  KC=/opt/jboss/keycloak/bin/kcadm.sh
  $KC config credentials --server http://localhost:8080/auth --realm master --user "$KEYCLOAK_USER" --password "$KEYCLOAK_PASSWORD"
  $KC create realms -s realm=kapua -s enabled=true

  $KC create clients -r kapua -s "redirectUris=[\"${KAPUA_CONSOLE_URL}/sso/callback\"]" -f - << EOF
    { "clientId": "kapua" }
EOF

  touch /opt/jboss/keycloak/standalone/data/first-run

  sleep 1

  kill %1
  wait %1

  echo "Keycloak shut down ... commencing normal startup"
fi

exec /opt/jboss/docker-entrypoint.sh $@
exit $?