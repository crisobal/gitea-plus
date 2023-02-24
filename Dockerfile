FROM docker.io/gitea/gitea:1.19-dev
LABEL maintainer="crispin@tschirky.ch"

EXPOSE 22 3000

RUN apk --no-cache add \
    asciidoctor \
    pandoc

ENV USER git
ENV GITEA_CUSTOM /data/gitea

VOLUME ["/data"]

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/bin/s6-svscan", "/etc/s6"]

COPY docker/app.ini /etc/templates/app.ini
RUN chmod 644 /etc/templates/app.ini