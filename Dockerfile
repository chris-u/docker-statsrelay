FROM centos

MAINTAINER Chris Ulrich <culrich@athenahealth.com>

COPY init /init 

RUN chmod 755 /init && \
    yum update -y && \
    yum -y install git autoconf automake gcc libev libev-devel libyaml-devel make && \
    cd /root/ && \
    #git clone https://github.com/chris-u/statsrelay.git && \
    git clone https://github.com/uber/statsrelay.git && \
    cd /root/statsrelay && \
    ./autogen.sh && \
    ./configure && \
    make all && \
    make install  && \
    yum remove -y cpp autoconf automake gcc libev-devel libyaml-devel make git perl rsync passwd fipscheck libmpc mpfr && \
    rpm -e basesystem && \
    rpm -e dbus-python && \
    rpm -e pygobject3-base && \
    rpm -e yum-utils && \
    rpm -e rootfiles && \
    rpm -e bind-license && \
    rpm -e less && \
    rpm -e libgomp && \
    rpm -e libgnome-keyring && \
    rpm -e m4 && \
    rpm -e hostname  && \
    rpm -e gobject-introspection && \
    rpm -e acl && \
    rpm -e libss && \
    rpm -e iputils && \
    rpm -e vim-minimal && \
    rpm -e groff-base && \
    rpm -e libedit && \
    rpm -e glibc-devel && \
    rpm -e dbus-glib && \
    rpm -e libxml2-python && \
    rpm -e python-kitchen && \
    rpm -e glibc-headers && \
    rpm -e python-chardet && \
    rpm -e kernel-headers && \
    yum clean all && \
    rm -rf /root/statsrelay/



#
#


#           perl-parent perl-podlators perl-Pod-Escapes perl-Text-ParseWords perl-Time-HiRes
#           perl-constant perl-threads-shared perl-Encode perl-Pod-Simple perl-Git
#           perl-Socket perl-Storable perl-Scalar-List-Utils perl-macros perl-File-Temp
#           perl-Filter perl perl-TermReadKey perl-Thread-Queue perl-HTTP-Tiny perl-Pod-Perldoc
#           perl-Pod-Usage perl-Exporter perl-Time-Local perl-Carp perl-PathTools perl-libs·
#           perl-File-Path perl-threads perl-Getopt perl-Error perl-Test-Harness perl-Data-Dumper
