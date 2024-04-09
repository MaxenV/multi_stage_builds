FROM scratch
ADD alpine-minirootfs-3.19.1-x86_64.tar /

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community nodejs npm

WORKDIR /app

COPY ./package.json ./
RUN npm install

COPY ./index.js ./

ARG VERSION
ENV VERSION=app.${VERSION:-noVersion}

EXPOSE 8080

CMD [ "npm", "start" ]