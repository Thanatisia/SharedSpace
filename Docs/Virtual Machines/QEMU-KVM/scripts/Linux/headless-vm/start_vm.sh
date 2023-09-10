: "
Startup headless VM with QEMU/KVM + NoVNC Web/Browser-based VNC Client
"

setup()
{
    : "
    Perform pre-initialization and setup processes
    "
    ## Check if settings file is found
    if [[ -f settings.sh ]]; then
        ## file is found
        ## Source
        . settings.sh
    else
        ## file is not found
        ## Exit
        echo -e "Settings file is not found, please create one before proceeding..."
        exit 1
    fi
}

start_vm()
{
    : "
    Startup Virtual Machine with VNC Display output for headless
    "
    ## Check if port is already used
    found="$(sudo ss -tupln | grep :${VNC_SERVER_PORT})"
    echo "$found"
    if [[ "$found" != "" ]]; then
        # Not empty = used
        echo -e "Port $VNC_SERVER_PORT is used."
    else
        # Empty - not used
        echo -e "Port $VNC_SERVER_PORT is not used."

        ## Startup QEMU/KVM Virtual Machine headless
        ${QEMU_EXEC} ${QEMU_EXEC_OPTS} ${QEMU_VM_OPTS} &

        echo -e "Virtual Machine has been started."
    fi
}

start_websocket()
{
    ## Check if port is already used
    found="$(sudo ss -tupln | grep :${WEBSOCKET_PORT})"
    echo "$found"
    if [[ "$found" != "" ]]; then
        # Not empty = used
        echo -e "Port $WEBSOCKET_PORT is used."
    else
        # Empty - not used
        echo -e "Port $WEBSOCKET_PORT is not used."

        ## Startup NoVNC WebSockify Web/browser-based VNC Client
        ${WEBSOCKET_EXEC} ${WEBSOCKET_OPTS} ${WEBSOCKET_PORT} ${VNC_SERVER_IP}:${VNC_SERVER_PORT}
        
        echo -e "Web/Browser-based VNC Client Websocket has been started."
    fi
}

main()
{
    start_vm
    start_websocket
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
