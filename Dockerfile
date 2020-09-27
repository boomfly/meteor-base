FROM ubuntu

RUN apt-get update && apt-get install -y curl build-essential python sudo bash

RUN \
  curl https://raw.githubusercontent.com/meteor/meteor/master/scripts/admin/launch-meteor > /usr/local/bin/meteor && \
  chmod +x /usr/local/bin/meteor

RUN \
  useradd -ms /bin/bash meteor && \
  mkdir /opt/app && chown meteor:meteor /opt/app

WORKDIR /opt/app
USER meteor
