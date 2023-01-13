FROM alpine:3

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="James Hunt <images@huntprod.com>" \
      summary="Run csvkit in a container" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/filefrog/csvkit.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0"

RUN apk add python3 py3-pip && pip3 install csvkit
COPY entrypoint.sh /entrypoint.sh
WORKDIR /csv
ENTRYPOINT ["/entrypoint.sh"]
CMD ["look"]
