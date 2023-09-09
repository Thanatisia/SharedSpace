: "
Settings for the Headless Virtual Machine setup framework

using 
- QEMU/KVM as the Hypervisor and
- Websockify for the WebSocket Web/browser-based VNC Client
"
VNC_SERVER_IP=${1:-192.168.1.43}
VNC_SERVER_DISPLAY_MONITOR=${2:-1}
VNC_SERVER_PORT=${3:-5901}
QEMU_EXEC=~/Desktop/qemu-system-x86_64
QEMU_EXEC_OPTS="-L /usr/local/share/qemu-x86_64/ -bios /usr/local/share/qemu-x86_64/bios-256k.bin"
QEMU_VM_OPTS="-name 'TestVM' -m 1024 -cdrom $HOME/Desktop/files/ISO/alpine-standard-3.18.3-aarch64.iso -drive file=$HOME/Desktop/lab/vm/alpine-linux/alpine.qcow2,format=raw -vnc :$VNC_SERVER_DISPLAY_MONITOR -enable-kvm"
NOVNC_PATH=~/Desktop/files/git/repos/novnc
WEBSOCKET_EXEC=websockify
WEBSOCKET_PORT=6080
WEBSOCKET_OPTS="-D --web=${NOVNC_PATH}"

