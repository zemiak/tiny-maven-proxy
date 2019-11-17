FROM openjdk:8-jre-alpine

WORKDIR /opt
COPY tiny-maven-proxy.jar /opt/
RUN apk add --no-cache curl

EXPOSE 5956

VOLUME /var/lib/maven

HEALTHCHECK \
 CMD curl --fail http://localhost:5956 || exit 1

ENTRYPOINT ["java",\
            "-Djava.security.egd=file:/dev/./urandom",\
            "-Dhttp.nonProxyHosts=localhost",\
            "-XX:+UnlockExperimentalVMOptions",\
            "-XX:+UseCGroupMemoryLimitForHeap",\
            "-XX:MaxRAMFraction=1",\
            "-jar",\
            "tiny-maven-proxy.jar",\
            "--maven.dir", "/var/lib/maven",\
            "--mirror", "https://jcenter.bintray.com,https://repo1.maven.org/maven2,https://plugins.gradle.org/m2"\
]
