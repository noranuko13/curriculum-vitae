# Image
FROM golang:1.24.3
RUN apt-get update -qq && apt-get install -y wget

# gh-md-toc
RUN wget https://github.com/ekalinin/github-markdown-toc.go/releases/download/v2.0.0/gh-md-toc_2.0.0_linux_amd64.tar.gz
RUN tar xzvf gh-md-toc_2.0.0_linux_amd64.tar.gz
