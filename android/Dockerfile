FROM centos:latest
MAINTAINER Pablo Sanabria "psanabria@uc.cl"
RUN yum update -y && yum install -y install java-1.8.0-openjdk-devel wget unzip
ENV JAVA_HOME /usr/lib/jvm/java
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_FILENAME android-sdk_r24.4.1-linux.tgz
ENV ANDROID_SDK_URL http://dl.google.com/android/${ANDROID_SDK_FILENAME}
ENV ANDROID_API_LEVELS android-22,android-23
ENV ANDROID_BUILD_TOOLS_VERSION 24.0.0
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN cd /opt && \
    wget -q ${ANDROID_SDK_URL} && \
    tar -xzf ${ANDROID_SDK_FILENAME} && \
    rm ${ANDROID_SDK_FILENAME} && \
    echo y | android update sdk --no-ui -a --filter tools,platform-tools,${ANDROID_API_LEVELS},build-tools-${ANDROID_BUILD_TOOLS_VERSION},extra-android-m2repository,extra-android-support,extra-google-google_play_services,extra-google-m2repository
CMD ["/bin/bash"]
