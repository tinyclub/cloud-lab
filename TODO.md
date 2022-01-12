
1. Improve scripts under Docker CE for Windows
2. Remove sudo prefix for desktop shotcuts boot
3. Add modules loading support for windows and macosx
    * Add minix support: [mfstool](http://mfstool.sourceforge.net/) or dkms based minix kernel driver support
    * Use dkms to add more drivers, such as minix fs, http://xmodulo.com/build-kernel-module-dkms-linux.html
4. Optimize performance issue of tools/docker/config, should be cleaned up and optimized
    * tools/docker/list, tools/docker/release very slow on windows.
    * the tools/docker/config should be dividied into several parts.
5. Export docker image and upload to Cloud Disk for late import to isolated network.
6. Add ebpf lab: https://github.com/zlim/bcc-docker
7. Add missing manpages?
8. Remove or minimize cloud-ubuntu-web and webvnc by default?
9. Add remote resizing support for x11vnc: https://github.com/LibVNC/x11vnc/pull/107
10. Clean up default novnc page
11. Change the entrypoint, from host (/tools/lab/run) to guest (/usr/bin/run)
    * the /usr/bin/run copy tools/lab/run to /usr/bin/lab-run and run it, so, the file can be released in host side.
