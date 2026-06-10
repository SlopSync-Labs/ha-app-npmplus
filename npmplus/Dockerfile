ARG BUILD_FROM
FROM zoeyvid/npmplus:latest

# Install jq for JSON parsing in startup script
RUN apk add --no-cache jq bash

COPY run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 80 81 443

CMD ["/run.sh"]
