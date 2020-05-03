FROM ruby:2.7-alpine

ARG USER_UID=1000
ARG GROUP_GID=1000
ARG VERSION=2.41.5

RUN set -xe; \
  addgroup -g $GROUP_GID user \
  && adduser -H -D -G user -u $USER_UID user \
  && mkdir /tests \
  && chown -R user:user /tests

RUN set -xe; \
  gem install serverspec -v $VERSION

USER user
WORKDIR /tests
ENTRYPOINT ["rake"]
CMD ["-vT"]
