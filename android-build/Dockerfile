FROM android:latest
MAINTAINER Pablo Sanabria "psanabria@uc.cl"
# Gradle
ENV GRADLE_VERSION gradle-2.14
ENV GRADLE_FILE ${GRADLE_VERSION}-bin.zip
ENV GRADLE_URL https://services.gradle.org/distributions/${GRADLE_FILE}
ENV GRADLE_HOME /opt/${GRADLE_VERSION}
ENV PATH ${PATH}:${GRADLE_HOME}/bin
RUN cd /opt && \
    wget -q ${GRADLE_URL} && \
    unzip ${GRADLE_FILE} && \
    rm ${GRADLE_FILE}
RUN cd /opt && \
    wget -q ${ANDROID_SDK_URL} && \
    tar -xzf ${ANDROID_SDK_FILENAME} && \
    rm ${ANDROID_SDK_FILENAME} && \
    echo y | android update sdk --no-ui -a --filter tools,platform-tools,${ANDROID_API_LEVELS},build-tools-${ANDROID_BUILD_TOOLS_VERSION},extra-android-m2repository,extra-android-support,extra-google-google_play_services,extra-google-m2repository
RUN mkdir -p /opt/project
WORKDIR /opt/project
ENTRYPOINT ["gradle"]
CMD ["build"]
