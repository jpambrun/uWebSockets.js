FROM node:15-buster
RUN apt update && apt install -y clang
RUN mkdir -p /workdir
WORKDIR /workdir
RUN pwd
COPY . /workdir
RUN ls
RUN make
RUN ls dist/*

# docker build --progress plain . -t uws
# docker run -it --rm  --entrypoint /bin/bash uws