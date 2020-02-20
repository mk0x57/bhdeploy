FROM alpine:latest
LABEL maintainer="https://github.com/mk0x57"


ENV VERSION=20200201
ENV PASSWORD=321654
ENV PORT=9998

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
  && mkdir -m 777 /brook \
  && cd /brook \
  && curl -L -H "Cache-Control: no-cache" -o brook https://github.com/txthinking/brook/releases/download/v${VERSION}/brook \
  && chmod +x brook \
  && chgrp -R 0 /brook \
  && chmod -R g+rwX /brook 

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 

CMD /entrypoint.sh
