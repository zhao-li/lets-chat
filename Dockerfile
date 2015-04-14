FROM node:0.10-onbuild
MAINTAINER SD Elements

ENV LCB_DATABASE_URI mongodb://db/letschat
EXPOSE 5000

# Implement HUBOT
RUN npm install -g \
  coffee-script \
  generator-hubot \
  hubot \
  hubot-lets-chat \
  yo

# yo does not fully support Docker and root yet:
# https://github.com/yeoman/yo/issues/101
RUN adduser --disabled-password --gecos "" yeoman
USER yeoman
RUN yo hubot
USER root
