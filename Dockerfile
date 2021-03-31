FROM node:6.1.0

RUN mkdir /usr/src/goof
COPY . /usr/src/goof
WORKDIR /usr/src/goof

RUN npm update
RUN npm install

WORKDIR /home/
RUN yes | dpkg --purge imagemagick
RUN wget https://download.imagemagick.org/ImageMagick/download/releases/ImageMagick-6.7.7-10.tar.xz
RUN tar -xf ImageMagick-6.7.7-10.tar.xz
WORKDIR /home/ImageMagick-6.7.7-10
RUN ./configure
RUN make install
RUN ldconfig /usr/local/lib
RUN cp /usr/local/bin/* /usr/bin/
WORKDIR /usr/src/goof


EXPOSE 3112
EXPOSE 31337
CMD ["npm", "start"]
