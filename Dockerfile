FROM adoptopenjdk/openjdk11:alpine
RUN apk add --update ttf-dejavu && rm -rf /var/cache/apk/*
LABEL Application="Sample Application"
RUN ln -s /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime
RUN addgroup -S sampleuser && adduser -S sampleuser --uid 1002 -G sampleuser
WORKDIR /app/config
COPY ./target/sample.jar /app/sample-SNAPSHOT.jar
RUN chown sampleuser: -R /app
USER sampleuser
CMD ["java","-jar","/app/sample-SNAPSHOT.jar"]