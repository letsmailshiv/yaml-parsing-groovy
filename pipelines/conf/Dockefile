FROM alpine:3.7
RUN apk add --no-cache openjdk8=8.212.04-r0
RUN addgroup -g 1000 appusr && \
    adduser -D -u 1000 -G appusr appusr
USER appusr
WORKDIR /home/appusr

CMD ["/bin/sh"]
