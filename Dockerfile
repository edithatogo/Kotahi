FROM cokoapps/base:20@sha256:a452b6d8dd8f2b2003fc627a58a3d1502ee9fe8245255985cdceaa9cfefcb882

WORKDIR /home/node/app

COPY .yarnrc.yml .
COPY package.json .
COPY yarn.lock .

RUN yarn install --immutable

WORKDIR /home/node/app/packages/server
COPY packages/server/.yarnrc.yml .
COPY packages/server/package.json .
COPY packages/server/yarn.lock .

WORKDIR /home/node/app/packages/client
COPY packages/client/.yarnrc.yml .
COPY packages/client/package.json .
COPY packages/client/yarn.lock .

WORKDIR /home/node/app/packages/devdocs
COPY packages/devdocs/.yarnrc.yml .
COPY packages/devdocs/package.json .
COPY packages/devdocs/yarn.lock .

WORKDIR /home/node/app/packages/server
RUN yarn install --immutable

WORKDIR /home/node/app/packages/client
RUN yarn install --immutable

WORKDIR /home/node/app/packages/devdocs
RUN yarn install --immutable

WORKDIR /home/node/app

COPY . .

# USER node
