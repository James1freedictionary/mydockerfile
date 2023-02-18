#!/bin/bash -ev
apk add gcompat npm openjdk11
mkdir /root/sdk && cd /root/sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip c*zip && mkdir latest && mv c*s/* latest/ && mv latest/ c*s/
export ANDROID_HOME=/root/sdk
printf "y\n" | $ANDROID_HOME/c*s/latest/bin/sdkmanager "emulator" "platform-tools" "platforms;android-33" "build-tools;33.0.2" "add-ons;addon-google_apis-google-24"
export PATH=$PATH:$ANDROID_HOME/platform-tools/
cd /root/
npm i -g nativescript
ns create aw --js
cd aw 
ns build android
