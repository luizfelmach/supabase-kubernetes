#!/bin/bash

set -euo pipefail

echo "Replacing env placeholders of /usr/local/kong/kong.yml"

sed -e "s|\${SUPABASE_ANON_KEY}|${SUPABASE_ANON_KEY}|" \
    -e "s|\${SUPABASE_SERVICE_KEY}|${SUPABASE_SERVICE_KEY}|" \
    -e "s|\${DASHBOARD_USERNAME}|${DASHBOARD_USERNAME}|" \
    -e "s|\${DASHBOARD_PASSWORD}|${DASHBOARD_PASSWORD}|" \
    /usr/local/kong/template.yaml \
    > /usr/local/kong/kong.yml

exec /docker-entrypoint.sh kong docker-start
