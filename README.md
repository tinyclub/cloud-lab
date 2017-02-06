
# Cloud Lab

Cloud Lab is a Docker based online lab center, it integrates many popular computer
science courses and provides a Docker based experiment environment as-is.

## Quickstart

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

### Build/Pull it

    $ tools/docker/pull          # Pull from docker hub

    Or

    $ tools/docker/build         # Build from source code


### Run the Lab

    $ tools/docker/identify 0    # Disable vnc password

    $ tools/docker/run

### Remove the Lab

    $ tools/docker/rm

### Stop the Lab

    $ tools/docker/stop

### Start the Lab

    $ tools/docker/start
