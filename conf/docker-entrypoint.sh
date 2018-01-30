#!/bin/sh -e

cat /etc/alertmanager/config.yml |\
    sed "s@username: '<user_name>'@username: '$SLACK_USER'@g" |\
    sed "s@channel: '#<channel_name>'@channel: '#$SLACK_CHANNEL'@g" |\
    sed "s@api_url: '<slack_web_hook_url>'@api_url: '$SLACK_URL'@g" > /tmp/config.yml

mv /tmp/config.yml /etc/alertmanager/config.yml

set -- /bin/alertmanager "$@"

exec "$@"