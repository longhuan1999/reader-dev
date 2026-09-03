FROM openjdk:8-jdk-alpine
# Install base packages
RUN \
    # apk update; \
    # apk upgrade; \
    # Add CA certs tini tzdata
    apk add --no-cache ca-certificates tini tzdata; \
    update-ca-certificates; \
    # Clean APK cache
    rm -rf /var/cache/apk/*; \
    mkdir -p /reader /app/bin

# 时区
ENV TZ=Asia/Shanghai

EXPOSE 8080
ENTRYPOINT ["/sbin/tini", "--"]
ADD ./bin/reader.jar /app/bin/reader.jar
WORKDIR /reader
CMD ["java", "-jar", "/app/bin/reader.jar" ]
