FROM alpine:latest

RUN apk add curl jq

ADD tag_to_files.sh /usr/local/bin

RUN chmod +x /usr/local/bin/tag_to_files.sh

ENTRYPOINT [ "/usr/local/bin/tag_to_files.sh" ]