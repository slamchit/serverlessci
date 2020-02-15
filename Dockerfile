FROM lambci/lambda:build-python3.8

USER root

ENV NODE_PATH=/opt/nodejs/node12/node_modules:/opt/nodejs/node_modules:/var/runtime/node_modules

RUN curl --silent --show-error --fail -o /usr/local/bin/ecs-cli \
  https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
  chmod +x /usr/local/bin/ecs-cli

RUN curl -sL https://rpm.nodesource.com/setup_13.x | bash - && \
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
RUN yum install -y make openssl ca-certificates wget yarn
RUN yum install -y docker

RUN yarn global add serverless

RUN npm config set registry http://registry.npmjs.org/ && \
    npm config set strict-ssl false

WORKDIR /src

COPY bin/startup.sh .
RUN "./startup.sh"

ENTRYPOINT []
