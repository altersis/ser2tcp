#!/usr/bin/env bashio

CONFIG_PATH=/data/options.json
echo "**************************************************"
echo "*        SERIAL TO TCP GATEWAY STARTUP           *"
echo "**************************************************"
declare debugmode

if bashio::config.equals 'log_level' 'debug' ; then 
    debugmode='--develop'
else
    debugmode=''
fi

if bashio::config.true 'list_usb_devices' ; then
    bashio::log.info "Connected USB devices:"
    lsusb
fi

#Run the redirector program using parameters set in the UI
python tcp_serial_redirect.py \
        $(bashio::config 'serial_port') \
        $(bashio::config 'speed') \
        --bytesize $(bashio::config 'data_bits') \
        --parity $(bashio::config 'parity') \
        --stopbits $(bashio::config 'ss_bits') \
        -P $(bashio::addon.port 7777) \
        ${debugmode}
