# Image
FROM ubuntu
RUN apt-get update -qq && apt-get install -y wget curl

# gh-md-toc
RUN wget https://raw.githubusercontent.com/ekalinin/github-markdown-toc/master/gh-md-toc
RUN chmod a+x gh-md-toc
