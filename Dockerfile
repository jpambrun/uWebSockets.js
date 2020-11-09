FROM ubuntu
RUN apt update && apt install -y clang build-essential libuv1-dev
RUN apt install -y curl
RUN mkdir -p /workdir
WORKDIR /workdir
RUN pwd
COPY . /workdir
RUN ls
RUN make
RUN ls dist/*

# docker build --progress plain . -t uws
# docker run -it --rm  --entrypoint /bin/bash uws