# Image
FROM ubuntu
RUN apt-get update -qq && apt-get install -y wget curl

# gh-md-toc
RUN wget https://raw.githubusercontent.com/ekalinin/github-markdown-toc/993239a2e0bc0b2d0db1317452bbd14bcb909f60/gh-md-toc
RUN chmod a+x gh-md-toc
