FROM android:latest
MAINTAINER Pablo Sanabria "psanabria@uc.cl"
# Gradle
ENV GRADLE_VERSION gradle-2.14.1
ENV GRADLE_FILE ${GRADLE_VERSION}-bin.zip
ENV GRADLE_URL https://services.gradle.org/distributions/${GRADLE_FILE}
ENV GRADLE_HOME /opt/${GRADLE_VERSION}
ENV PATH ${PATH}:${GRADLE_HOME}/bin
RUN cd /opt && \
    wget -q ${GRADLE_URL} && \
    unzip ${GRADLE_FILE} && \
    rm ${GRADLE_FILE}
RUN mkdir -p /opt/project
WORKDIR /opt/project
ENTRYPOINT ["gradle"]
CMD ["build"]
