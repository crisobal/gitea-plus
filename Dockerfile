FROM docker.io/gitea/gitea:1.19.1
LABEL maintainer="crispin@tschirky.ch" \
      org.opencontainers.image.base.name="docker.io/gitea/gitea" \      
      org.opencontainers.image.description="Gitea including adoc and md rendering" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.ref.name="1.19.1" \
      org.opencontainers.image.title="gitea-plus" \
      org.opencontainers.image.vendor="fhr.ch" 
      
      

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