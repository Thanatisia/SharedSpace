Containerization Platform: LXC - Linux Container
================================================

*Description*
-------------
- LXC (aka Linux Container) is a containerization platform (similar to Docker) that uses the Linux kernel as a shared library and 
    - Creats chrootable virtual environments (similar to Python virtual environments) for every container
        + Essentially making it lighter-weight compared to a Virtual Machine, but also usable as a Virtual Hypervisor-light compared to Docker
- LXC has its own private set of modules installed just for every newly-created containerized Virtual Environments
    - every virtual environment contains 
        + a symbolic link/hardlink (aka a copy) of the kernel (effectively equivalent to the python interpreter) installed on the system
        + The virtual environment modules (All the software in a linux distribution) are stored in a subdirectory within the virtual chroot environment
        - The script that the kernel executes is in '[rootfs-path]/sbin/init'
            + This script is systemd or busybox, depending on what the LXC guest's init process is
            + This will launch all of your startup files configured in '[rootfs-path]/etc'

## Resources

## References
+ [Linuxcontainers (LXC) - Getting Started](https://linuxcontainers.org/lxc/getting-started)

## Remarks

