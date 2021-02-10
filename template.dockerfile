FROM balenalib/%%BALENA_MACHINE_NAME%%-node:9-stretch-build
RUN install_packages git

WORKDIR /usr/src/app
COPY package.json package.json


RUN JOBS=MAX npm install --production --unsafe-perm && npm cache verify && rm -rf /tmp/
COPY . ./

ENV UDEV=1
CMD ["npm", "start"]

