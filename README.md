# docker-grafana

## Development Setup
* Install [confd](https://github.com/kelseyhightower/confd/blob/master/docs/installation.md).

## Running

* Build:
  * `make build`

* Run:
  * `docker run -p 3000:3000 -itd grafana-local-test`

* Push:
  * `make push`

* Rotate:
  * `make rotate`
  * `confd -onetime -backend env -config-file confd_files/conf.d/grafana.toml -confdir ./confd_files/`
