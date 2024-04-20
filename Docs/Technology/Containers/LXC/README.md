Containerization Platform: LXC - Linux Container
================================================

*Description*
-------------
- LXC (aka Linux Container) is a lightweight containerization platform (similar to Docker) that uses the Linux kernel as a shared library and 
    - Creats chrootable virtual environments (similar to Python virtual environments) for every container
        + Essentially making it lighter-weight compared to a Virtual Machine, but also usable as a Virtual Hypervisor-light compared to Docker
- LXC has its own private set of modules installed just for every newly-created containerized Virtual Environments
    - every virtual environment contains 
        + a symbolic link/hardlink (aka a copy) of the kernel (effectively equivalent to the python interpreter) installed on the system
        + The virtual environment modules (All the software in a linux distribution) are stored in a subdirectory within the virtual chroot environment
        - The script that the kernel executes is in '[rootfs-path]/sbin/init'
            + This script is systemd or busybox, depending on what the LXC guest's init process is
            + This will launch all of your startup files configured in '[rootfs-path]/etc'

- In summary:
    - LXC is a lightweight containerization platform that is like a middle point between Virtual Machines and Docker
        - Containers are simply like Virtual Environments (i.e. python venv and cargo env) that is effectively an isolated root filesystem directory
            - containing the rootfs contents of a bootable, chrootable working system

> The operational setup process is like such

- User will specify the rootfs.tar.gz (Generic name for a working, chrootable, bootable root filesystem tarball archive) and startup the LXC container
    - LXC will extract the tarball archive into a 'containerized', isolated virtual environment directory
        + This directory will be stored as a template image for reusage
- User will then startup a container with various parameters such as the container ID, container name, base image template etc etc
    - On creation, 
        - The image template directory will be copied and used for the container 
            + this directory will now be used as a chroot mount point housing the LXC container you created as well as some of the host system's linux kernel and virtual/pseudo filesystems
    + Entering the container via lxc will be similar to running 'chroot [lxc-mount-point]' in theory and understanding


## Resources

## References
+ [Linuxcontainers (LXC) - Getting Started](https://linuxcontainers.org/lxc/getting-started)

## Remarks

