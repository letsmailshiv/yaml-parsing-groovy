FROM alpine:3.7
MAINTAINER Shivendra Sharma "shivendra.sharma@publicissapient.com"
RUN apk add --no-cache openjdk8
RUN addgroup -g 1000 appusr && \
    adduser -D -u 1000 -G appusr appusr
USER appusr
WORKDIR /home/appusr

CMD ["/bin/sh"]
