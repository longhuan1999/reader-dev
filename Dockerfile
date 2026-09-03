FROM endless084/reader

RUN mkdir -p /reader /app/bin

# 时区
ENV TZ=Asia/Shanghai

WORKDIR /reader

EXPOSE 8080
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["java", "-jar", "/app/bin/reader.jar" ]
