#!/bin/bash
# sudo su - root -c "/etc/profile.d/atos.sh"
# PostgreSQL
sudo mkdir -p /tmp/.pg
if ! pgrep postgres >/dev/null; then
    if [[ -f /opt/postgresql/pgsvr/bin/pgsvr.sh ]]; then
        sudo su - postgres -c "pgsvr -s pgdefault start"
    fi
fi

# Microfocus License Manager
sudo mkdir -p /tmp/.mfl
if ! pgrep lserv >/dev/null; then
    if [[ -f /var/microfocuslicensing/bin/startboth.sh ]]; then
        sudo /var/microfocuslicensing/bin/startboth.sh
    fi
fi
# Jexec - on the hosts now to avoid to run the container with priv
sudo mkdir -p /tmp/.jexec
if [[ -f /usr/java/default/.java/init.d/jexec ]]; then
   sudo /usr/java/default/.java/init.d/jexec start
fi

# Redis
# Note: the ltp redis are normaly managed by the RPM installation (spec file)
# But we still want to start the system wide redis until they stop using it LOL
# The next line will not work if the container is not started in priviledge mode
if ! mount | grep "/proc/sys " | grep -q ro; then
    echo "1024" | sudo tee /proc/sys/net/core/somaxconn
fi
# Redis configuration (version 3)
# Some PATHs (in version 4) have changed, be forward compatible for now
sudo mkdir -p /tmp/.redis
[[ ! -x /usr/bin/redis-shutdown && -x /usr/libexec/redis-shutdown ]] && sudo ln -s /usr/libexec/redis-shutdown /usr/bin/redis-shutdown
[[ ! -x /usr/bin/redis-server   && -x /usr/sbin/redis-server ]]      && sudo ln -s /usr/sbin/redis-server      /usr/bin/redis-server

[[ -f /etc/redis.conf ]] && redis_config=/etc/liber/ltp-redis-flock.conf
eval sudo setsid /usr/bin/redis-server ${redis_config-} &

[[ -f /etc/redis.conf ]] && redis_config=/etc/liber/ltp-redis-gdg.conf
eval sudo setsid /usr/bin/redis-server ${redis_config-} &
echo
set -e
echo "run ltpconfigure.sh"
sudo su - tester  -c "ltpconfigure.sh"
echo "run ltp start"
sudo su - tester  -c "ltp start"

# Wait for SIGTERM
wait
