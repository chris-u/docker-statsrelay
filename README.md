# docker-statsrelay
Build a statsrelay docker image using centos as the base image.

set the environment variable "statsrelay_yaml" for the contents of the config file for your specific environment.


docker build -t 'statsrelay' https://raw.githubusercontent.com/chris-u/docker-statsrelay/master/Dockerfile

