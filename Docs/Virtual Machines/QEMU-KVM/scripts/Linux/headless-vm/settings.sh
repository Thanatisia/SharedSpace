: "
Settings for the Headless Virtual Machine setup framework

using 
- QEMU/KVM as the Hypervisor and
- Websockify for the WebSocket Web/browser-based VNC Client
"
VNC_SERVER_IP=${1:-place-your-default-server-ip-here}
VNC_SERVER_DISPLAY_MONITOR=${2:-1}
VNC_SERVER_PORT=${3:-5901}
QEMU_EXEC=qemu-system-x86_64
QEMU_EXEC_OPTS="-L /usr/local/share/qemu-x86_64/ -bios /usr/local/share/qemu-x86_64/bios-256k.bin"
QEMU_VM_OPTS="-name 'vm-name' -m 1024 -cdrom [iso-file] -drive file=[.qcow2 file],format=raw -vnc :$VNC_SERVER_DISPLAY_MONITOR -enable-kvm"
NOVNC_PATH=/usr/share/novnc
WEBSOCKET_EXEC=websockify
WEBSOCKET_PORT=6080
WEBSOCKET_OPTS="-D --web=${NOVNC_PATH}"

