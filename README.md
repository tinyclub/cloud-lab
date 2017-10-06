
# Cloud Lab

Cloud Lab is a Docker based online lab center, it integrates many popular computer
science courses and provides a Docker based experiment environment as-is.

## Quickstart

### Install docker

Cload Lab is docker based, please make sure docker environment is installed:

* Linux: [Docker CE](https://store.docker.com/search?type=edition&offering=community)
* Windows or Mac OS: [Docker Toolbox](https://www.docker.com/docker-toolbox)

### Choose a Lab

    $ tools/docker/choose

    Current Lab is: linux-lab

    Available Labs:

         1	cs630-qemu-lab
         2	linux-0.11-lab
         3	linux-lab
         4	markdown-lab
         5	qing-lab
         6	tinylab.org

    Choose the lab number:
         4	markdown-lab


    Download the lab...

### Run the Lab

    $ tools/docker/run

### Remove the Lab

    $ tools/docker/rm

### Stop the Lab

    $ tools/docker/stop

### Start the Lab

    $ tools/docker/start
