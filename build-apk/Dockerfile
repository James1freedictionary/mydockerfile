FROM amazoncorretto:17
COPY Dockerfile Dockerfile
RUN yum install -y tar wget unzip git
#RUN apt update && apt install -y wget unzip git
ENV ANDROID_HOME=/android/sdk
ENV ANDROID_SDK_ROOT=$ANDROID_HOME
WORKDIR $ANDROID_SDK_ROOT
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip && unzip *.zip
RUN cd cmdline-tools/bin && yes | ./sdkmanager --licenses --sdk_root=$ANDROID_SDK_ROOT && yes | ./sdkmanager "platforms;android-33" "build-tools;33.0.0" "platform-tools" "patcher;v4" "cmdline-tools;latest" --sdk_root=$ANDROID_SDK_ROOT
RUN wget https://services.gradle.org/distributions/gradle-7.4.2-bin.zip && unzip gradle*.zip && cd gradle*2 && cd bin && ln -s $(pwd)/gradle /sbin 
RUN git clone https://github.com/techwithtim/Walk-In-Clinic-Android-App && git clone https://github.com/imShakil/BloodBank && git clone https://github.com/ritik2410/Elegant_Calculator
RUN wget https://transfer.sh/Qwrcx4/camera-samples.tgz -O camera-samples.tgz && tar xvzf camera-samples.tgz
RUN cd Blo* && cat build.gradle && gradle build 
#RUN cd camera-samples/Ca*o && wget https://transfer.sh/IcSJJs/build.gradle -O build.gradle && cat build.gradle && gradle build
CMD sh

