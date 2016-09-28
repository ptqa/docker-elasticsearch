FROM elasticsearch:5.0

MAINTAINER Guillaume Simonneau <simonneaug@gmail.com>

COPY config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

## install modules
RUN bin/elasticsearch-plugin install x-pack --batch

# Add roles
COPY config/roles.yml /elasticsearch/config/shield/

ENV admin="admin" \
    admin_pwd="changeme" \
    power_user="power-user" \
    power_user_pwd="changeme" \
    user="user" \
    user_pwd="changeme" \
    kibana_server="kibana-server" \
    kibana_server_pwd="changeme" \
    kibana_user="kibana" \
    kibana_pwd="changeme" \
    logstash_user="logstash" \
    logstash_pwd="changeme" \
    marvel_user="marvel" \
    marvel_pwd="changeme" \
    remote_marvel_agent="marvel-agent" \
    remote_marvel_agent_pwd="changeme" \
    watcher_admin="watcher-admin" \
    watcher_admin_pwd="changeme"

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["elasticsearch"]