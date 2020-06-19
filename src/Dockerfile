FROM alpine:latest

RUN apk add curl jq

ADD convert.sh /usr/local/bin/convert

RUN chmod +x /usr/local/bin/convert

CMD [ "/usr/local/bin/convert" ]