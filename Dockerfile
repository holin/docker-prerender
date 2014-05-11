FROM dockerfile/nodejs

RUN apt-get install -y \
    python2.7 python-pip \
    libfreetype6 libfontconfig

RUN cd / && git clone https://github.com/prerender/prerender
RUN cd /prerender && npm install

RUN sed -i '/server.start()/i server.use(prerender.basicAuth());' /prerender/server.js

CMD node /prerender/server.js
