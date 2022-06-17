FROM amazoncorretto:latest
COPY Dockerfile Dockerfile
RUN yum install -y wget unzip git
#RUN apt update && apt install -y wget unzip git
#RUN apk update && apk add wget unzip git
WORKDIR /android/sdk
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip && unzip *.zip && mv cmdline-tools latest && mkdir cmdline-tools && mv latest cmdline-tools
RUN yes "y" | cmdline-tools/latest/bin/sdkmanager "platforms;android-33" "build-tools;33.0.0"
RUN wget https://services.gradle.org/distributions/gradle-7.4.2-bin.zip && unzip gradle*.zip && cd gradle*2 && cd bin && ln -s $(pwd)/gradle /sbin 
ENV ANDROID_SDK_ROOT=/android/sdk
ENV ANDROID_HOME=/android/sdk
RUN git clone https://github.com/techwithtim/Walk-In-Clinic-Android-App && git clone https://github.com/imShakil/BloodBank && git clone https://github.com/ritik2410/Elegant_Calculator
RUN cd Walk*/Source* && gradle assemble
CMD sh

