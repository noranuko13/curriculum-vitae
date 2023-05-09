# Image
FROM ubuntu
RUN apt-get update -qq && apt-get install -y wget curl

# gh-md-toc
RUN wget https://raw.githubusercontent.com/ekalinin/github-markdown-toc/661b5c5111f47174e2d9092c8d76867e5a1f249d/gh-md-toc
RUN chmod a+x gh-md-toc
