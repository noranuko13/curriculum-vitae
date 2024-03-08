# Image
FROM golang:1.22.1
RUN apt-get update -qq && apt-get install -y wget

# gh-md-toc
RUN wget https://github.com/ekalinin/github-markdown-toc.go/releases/download/v1.4.0/gh-md-toc_1.4.0_linux_amd64.tar.gz
RUN tar xzvf gh-md-toc_1.4.0_linux_amd64.tar.gz
