FROM ubuntu
MAINTAINER korbin <k1@k1.io>

RUN apt-get update
RUN apt-get -y install wget

ADD screenconnect_install.sh /tmp/sc/
ADD http://www.screenconnect.com/Download?Action=DownloadLatest&Platform=Linux&PreRelease=true /tmp/sc/sc.tar.gz

ENV PATH /opt/screenconnect/App_Runtime/bin/:$PATH
ENV MONO_PATH /opt/screenconnect/App_Runtime/lib/
ENV MONO_CFG_DIR /opt/screenconnect/App_Runtime/etc/
ENV XDG_CONFIG_HOME /opt/screenconnect/App_Runtime/etc/
ENV MONO_XMLSERIALIZER_THS no

RUN /tmp/sc/screenconnect_install.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["mono", "/opt/screenconnect/Bin/Elsinore.ScreenConnect.Service.exe", "startservices", "7", "1", "10"]

EXPOSE 8040 8041
