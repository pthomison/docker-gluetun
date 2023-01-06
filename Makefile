build:
	docker build . -t pthomison/gluetun:localbuild

RUN_CONTAINER=docker run -it --rm pthomison/gluetun:localbuild

GIT_REV=$(shell git rev-parse --short HEAD)

shell: build
	$(RUN_CONTAINER) /bin/zsh

tag: build
	docker tag pthomison/gluetun:localbuild  pthomison/gluetun:latest
	docker tag pthomison/gluetun:localbuild  pthomison/gluetun:$(GIT_REV)

push: tag
	docker push pthomison/gluetun:latest
	docker push pthomison/gluetun:$(GIT_REV)

clean:
	docker rmi \
		pthomison/gluetun:localbuild \
		pthomison/gluetun:latest
