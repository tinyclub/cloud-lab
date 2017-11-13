
1. Add 'Android Lab' for Android development.
2. Add 'IoT Lab' for IoT development.
3. Add fail2ban support: rsyslog + fail2ban
4. Reduce the lab size
   * Remove noVNC support if possible
   * Integreate noVNC outselvies and install necessary packages
5. Fix up open files limitation, up to 1000?: /proc/sys/fs/inotify/max_user_instances
6. Allow vncserver reuse the unix account for login: multi users on one container to save resources? not safety?
7. Load variables for container via environment variables, not mount the configs/ into it, require to modify tools/docker/start.
8. Add support for Docker Toolbox (Busybox environment)
   Need chroot to a Busybox rootfs and make cloud lab work in it.
   ref: https://github.com/boot2docker/boot2docker/releases
9. Add notify feature for LXDE: libnotify-bin notify-osd
   $ DISPLAY=:1 notify-send 'The system will be turned off in 5 minutes' --urgency=critical -t 0
10. Update the password in 5 minutes
   $ tools/docker/cmd linux-0.11-lab 'sh -c "echo ffffff > ~/.vnc/passwdfile; pkill x11vnc"'
11. Notify and update the system
   $ tools/docker/cmd linux-0.11-lab 'sh -c "DISPLAY=:1 notify-send \"System will be turned off in 5 seconds\" -t 0;  sleep 5; echo ffffff > ~/.vnc/passwdfile; pkill x11vnc"'
12. Add multiple security levels
13. Verify the auto start logic, /etc/rc.local?
14. Fix up tools/docker/publish, .vnc-token path
15. Add guacamole suppport, another web vnc implementation
    http://guacamole.incubator.apache.org/doc/gug/
16. Fix up cgroup swap support warning
    edit /etc/default/grub, and set GRUB_CMDLINE_LINUX to "cgroup_enable=memory swapaccount=1", then run "sudo update-grub"
17. Add io limitation
18. lep-lab
    fix up perf report, ref: https://stackoverflow.com/questions/38927895/how-do-you-get-debugging-symbols-working-in-linux-perf-tool-inside-docker-contai
    enable kernel with sched statistic information
    add qemu-system-ARCH for lepd running and kernel customization, or simply use lep-lab with linux-lab.
