FROM centos

MAINTAINER Chris Ulrich <culrich@athenahealth.com>

COPY https://raw.githubusercontent.com/chris-u/docker-statsrelay/master/init /init 

RUN chmod 755 /init && \
    yum update -y && \
    yum -y install git autoconf automake gcc libev libev-devel libyaml-devel make && \
    cd /root/ && \
    git clone https://github.com/uber/statsrelay.git && \
    cd /root/statsrelay && \
    ./autogen.sh && \
    ./configure && \
    make all && \
    make install  && \
    yum remove -y cpp autoconf automake gcc libev-devel libyaml-devel make git perl rsync passwd fipscheck libmpc mpfr && \
    rpm -e basesystem dbus-python pygobject3-base yum-utils rootfiles bind-license less libgomp libgnome-keyring m4 hostname \
           gobject-introspection acl libss iputils vim-minimal groff-base libedit glibc-devel dbus-glib libxml2-python \
           python-kitchen glibc-headers python-chardet kernel-headers && \
    yum clean all && \
    rm -rf /root/statsrelay/
