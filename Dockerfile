FROM qmcgaw/gluetun:v3.32

RUN apk update && apk upgrade

RUN apk add bash dumb-init curl