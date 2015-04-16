FROM node:0.10-onbuild
MAINTAINER SD Elements

ENV LCB_DATABASE_URI mongodb://db/letschat
EXPOSE 5000

# Implement HUBOT
RUN npm install -g \
  coffee-script \
  generator-hubot \
  hubot \
  yo

# yo does not fully support Docker and root yet:
# https://github.com/yeoman/yo/issues/101
RUN adduser --disabled-password --gecos "" yeoman
RUN chown -R yeoman /usr
USER yeoman
WORKDIR /usr/src
RUN mkdir /usr/src/hubot
WORKDIR /usr/src/hubot
RUN yo hubot --defaults
USER root
RUN npm install --save hubot-lets-chat
RUN npm install -g
WORKDIR /usr/src/app
