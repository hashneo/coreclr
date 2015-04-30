FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install wget -y
RUN echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.6 main" | tee /etc/apt/sources.list.d/llvm.list
RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update
RUN apt-get install git cmake llvm-3.5 clang-3.5 lldb-3.6 lldb-3.6-dev libunwind8 libunwind8-dev libssl-dev gettext -y

RUN git clone https://github.com/dotnet/coreclr.git ~/git/coreclr/
RUN git clone https://github.com/dotnet/corefx.git ~/git/corefx/
