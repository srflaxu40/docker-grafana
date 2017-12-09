# docker-grafana

## Development Setup
* Install [confd](https://github.com/kelseyhightower/confd/blob/master/docs/installation.md).
* Set your environment variables in the TOML file - the location is here `./confd_files/conf.d/`.
  - These are needed for confd to rotate in configuration properly.

## Running

* Rotate:
  * `make rotate`
  * `confd -onetime -backend env -config-file confd_files/conf.d/grafana.toml -confdir ./confd_files/`

* Build:
  * `make build`

* Run:
  * `docker run -p 3000:3000 -itd grafana-local-test`

* Push:
  * `make push`

