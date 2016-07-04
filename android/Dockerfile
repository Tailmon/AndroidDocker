FROM centos:latest
MAINTAINER Pablo Sanabria "pablo.s.q1.4.1991@gmail.com"
RUN yum update -y && yum install -y install java-1.8.0-openjdk-devel wget unzip
ENV GRADLE_VERSION gradle-2.14
ENV GRADLE_FILE ${GRADLE_VERSION}-bin.zip
ENV GRADLE_URL https://services.gradle.org/distributions/${GRADLE_FILE}
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.91-1.b14.el7_2.x86_64
ENV ANDROID_HOME /opt/android-sdk-linux
# Gradle
ENV GRADLE_HOME /opt/${GRADLE_VERSION}
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${GRADLE_HOME}/bin
RUN cd /opt && \
    wget -q ${GRADLE_URL} && \
    unzip ${GRADLE_FILE} && \
    rm ${GRADLE_FILE}
# Android Files
ENV ANDROID_SDK_FILENAME android-sdk_r24.4.1-linux.tgz
ENV ANDROID_SDK_URL http://dl.google.com/android/${ANDROID_SDK_FILENAME}
ENV ANDROID_API_LEVELS android-22,android-23
ENV ANDROID_BUILD_TOOLS_VERSION 24.0.0
RUN cd /opt && \
    wget -q ${ANDROID_SDK_URL} && \
    tar -xzf ${ANDROID_SDK_FILENAME} && \
    rm ${ANDROID_SDK_FILENAME} && \
    echo y | android update sdk --no-ui -a --filter tools,platform-tools,${ANDROID_API_LEVELS},build-tools-${ANDROID_BUILD_TOOLS_VERSION},extra-android-m2repository,extra-android-support,extra-google-google_play_services,extra-google-m2repository
RUN mkdir -p /opt/project
WORKDIR /opt/project
ENTRYPOINT ["gradle"]
CMD ["build"]

