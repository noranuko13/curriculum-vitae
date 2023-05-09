# Image
FROM golang:1.20.4
RUN apt-get update -qq && apt-get install -y wget

# gh-md-toc
RUN wget https://github.com/ekalinin/github-markdown-toc.go/releases/download/v1.2.1/gh-md-toc_1.2.1_linux_amd64.tar.gz
RUN tar xzvf gh-md-toc_1.2.1_linux_amd64.tar.gz
