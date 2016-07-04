FROM centos:latest
MAINTAINER Pablo Sanabria "pablo.s.q1.4.1991@gmail.com"
RUN yum update -y && yum install -y install java-1.8.0-openjdk-devel wget unzip
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.91-1.b14.el7_2.x86_64
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
ENV ANDROID_SDK_FILENAME android-sdk_r24.4.1-linux.tgz
ENV ANDROID_SDK_URL http://dl.google.com/android/${ANDROID_SDK_FILENAME}
ENV ANDROID_API_LEVELS android-22,android-23
ENV ANDROID_BUILD_TOOLS_VERSION 24.0.0
ENV DISPLAY :1
RUN cd /opt && \
    wget -q ${ANDROID_SDK_URL} && \
    tar -xzf ${ANDROID_SDK_FILENAME} && \
    rm ${ANDROID_SDK_FILENAME} && \
    echo y | android update sdk --no-ui -a --filter tools,platform-tools,${ANDROID_API_LEVELS},build-tools-${ANDROID_BUILD_TOOLS_VERSION},extra-android-m2repository,extra-android-support,extra-google-google_play_services,extra-google-m2repository,sys-img-x86-google_apis-23,addon-google_apis-google-23,sys-img-armeabi-v7a-google_apis-23
RUN echo no | android create avd -n "API23-x86" -t "android-23" -b google_apis/armeabi-v7a
# QT Dependencies
RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-7.noarch.rpm && \
    rpm -ivh epel-release-7-7.noarch.rpm && \
    rm *.rpm
RUN yum update -y && yum install -y qt5-qtbase qt5-qtbase-gui pciutils
RUN mkdir -p /opt/project
ADD runapk.sh /usr/local/bin
WORKDIR /opt/project
ENTRYPOINT ["runapk.sh"]
