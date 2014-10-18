#!/bin/bash

mkdir -p /tmp/sc/install/
mkdir -p /opt/screenconnect/

#Untar into install and strip first directory
tar xzf /tmp/sc/sc.tar.gz --strip-components=1 -C /tmp/sc/install/

#Copy screenconnect runtimes
cp -r /tmp/sc/install/ScreenConnect/* /opt/screenconnect/

#Copy bundled mono
cp /tmp/sc/install/Installer/mono_linux_02_x86_64 /opt/screenconnect/App_Runtime/bin/mono
chmod 755 /opt/screenconnect/App_Runtime/bin/*

#Run configuration file tranformation
mono /tmp/sc/install/Installer/Xsl.exe /opt/screenconnect/web.config /tmp/sc/install/Installer/TransformWebConfig.xsl /opt/screenconnect/web.config configuration=Release platform=Mono
