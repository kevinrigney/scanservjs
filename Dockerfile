from node:13.7.0-buster

RUN apt-get update && \
    apt-get install -y \
        sane-utils \
        imagemagick && \
    rm -rf /var/lib/apt/lists/*

COPY . /scanservjs

WORKDIR /scanservjs

RUN npm install  && \
    npm run-script build && \
    npm install --production

CMD ["node","server.js"]
