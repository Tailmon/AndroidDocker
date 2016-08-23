FROM android:latest
MAINTAINER Pablo Sanabria "psanabria@uc.cl"
RUN echo y | android update sdk --no-ui -a --filter sys-img-armeabi-v7a-google_apis-23
# RUN echo y | android update sdk --no-ui -a --filter sys-img-x86-google_apis-23,addon-google_apis-google-23,sys-img-armeabi-v7a-google_apis-23
RUN echo no | android create avd -n "API23" -t "android-23" -b google_apis/armeabi-v7a
ENV DISPLAY :1
# QT Dependencies
RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-7.noarch.rpm && \
    rpm -ivh epel-release-7-7.noarch.rpm && \
    rm *.rpm
RUN yum update -y && yum install -y qt5-qtbase qt5-qtbase-gui pciutils
RUN dbus-uuidgen > /var/lib/dbus/machine-id
RUN mkdir -p /opt/project
ADD runapk.sh /usr/local/bin
WORKDIR /opt/project
ENTRYPOINT ["runapk.sh"]
