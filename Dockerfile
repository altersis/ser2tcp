ARG BUILD_FROM=hassioaddons/base:latest
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Copy data for add-on
COPY run.sh /

RUN pip install pyserial \
    \
    && curl -J -L -o /tcp_serial_redirect.py \
        "https://raw.githubusercontent.com/altersis/pyserial/master/examples/tcp_serial_redirect.py"

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Set our add-on persistent data directory.
WORKDIR /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

# Labels
LABEL \
    io.hass.name="Serial 2 TCP Gateway" \
    io.hass.description="gateway to connect your RS232 devices to the network" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Gerardo Castillo <altersis@addons.community>" \
    org.label-schema.description="connect your rs232 devices 2 TCP" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Ser 2 TCP" \
    org.label-schema.schema-version="dev" \
    org.label-schema.url="https://community.home-assistant.io/" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-nut/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-nut" \
    org.label-schema.vendor="Home Assistant Community Addons"