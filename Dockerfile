FROM node:alpine

RUN apk --update --no-cache add git openssh

ENV SEMANTIC_RELEASE_VERSION=15.13.21
RUN npm install -g \
  semantic-release@${SEMANTIC_RELEASE_VERSION} \
  @semantic-release/changelog \
  @semantic-release/exec \
  @semantic-release/git \
  @semantic-release/github \
  && \
  npm cache clean --force

RUN mkdir -p ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN mkdir -p /app
WORKDIR /app

CMD ["semantic-release", "--help"]
