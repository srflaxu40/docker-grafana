FROM ubuntu:16.04

ENV GRAFANA_VERSION 5.0.3

COPY run.sh /run.sh

RUN apt-get update && \
    apt-get install -y git wget curl && \
    wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_${GRAFANA_VERSION}_amd64.deb && \
    apt-get install -y adduser libfontconfig && \
    dpkg -i grafana_${GRAFANA_VERSION}_amd64.deb && \
    chmod +x /run.sh && \
    grafana-cli plugins install grafana-worldmap-panel && \
    grafana-cli plugins install raintank-worldping-app && \
    grafana-cli plugins install abhisant-druid-datasource && \
    grafana-cli plugins install vonage-status-panel && \
    grafana-cli plugins install grafana-piechart-panel && \
    grafana-cli plugins install grafana-clock-panel && \
    grafana-cli plugins install ryantxu-ajax-panel && \
    grafana-cli plugins install  bessler-pictureit-panel

COPY grafana.ini /etc/grafana/grafana.ini

RUN mkdir -p /var/lib/grafana/plugins && \
    chmod -R 0755 /var/lib/grafana

WORKDIR /var/lib/grafana/plugins

RUN git clone https://github.com/briangann/grafana-sensu-datasource.git && \
    wget https://github.com/sraoss/grafana-sqldb-datasource/releases/download/V0.2_beta2/grafana-sqldb_20160818.tar.gz && \
    tar -xvzf grafana-sqldb_20160818.tar.gz

EXPOSE 3000

CMD ["/run.sh"]
