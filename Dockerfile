# Image
FROM ubuntu
RUN apt-get update -qq && apt-get install -y wget curl

# gh-md-toc
RUN wget https://raw.githubusercontent.com/ekalinin/github-markdown-toc/488f310064b16c1eb9c17862cc5844189ee65955/gh-md-toc
RUN chmod a+x gh-md-toc
