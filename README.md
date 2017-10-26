
* Build:
  *  `docker build -t grafana-local-test -f Dockerfile .`

* Run:
  * `docker run -p 3000:3000 -itd grafana-local-test`

* CRT was encrypted with:
  * `openssl enc -aes-256-cbc -pass env:LDAP_KEY -in ca.crt -out ca.crt.encrypted`

* Decrypt CRT with `LDAP_KEY` which is in Jenkins or LastPass:
  * `openssl enc -aes-256-cbc -pass env:LDAP_KEY -in ca.crt.encrypted -out ca.crt -d`

* Using WorldPing requires setting API key manually until API key enabling is automated (@TO-DO).

* Confd rotation:
  `confd -onetime -interval=6 -confdir="${WORKSPACE}/confd_files" -backend="redis" -keep-stage-file -node ${REDIS_DOCKER}:6379`

* Seed Grafana Environment:
  * [seed-grafana-redis](https://jenkins.demandbase.com/job/rancher-deploy-grafana/configure)

* Build and Deploy Grafana:
  * [rancher-deploy-grafana](https://jenkins.demandbase.com/job/rancher-deploy-grafana/)

* Grafana Nightly Backups Job:
  * [backup-grafana-to-s3](https://jenkins.demandbase.com/job/backup-grafana-to-s3/)

## Confd:
  * Confd files are rotated in the `rancher-deploy-grafana` job by a sed on an environment specific token, and then by running
    the following:
    * `confd -onetime -interval=6 -confdir="${WORKSPACE}/confd_files" -backend="redis" -keep-stage-file -node ${REDIS_DOCKER}:6379`
