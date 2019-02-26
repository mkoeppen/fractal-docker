FROM node:10-alpine


VOLUME ["/var/www/project"]
WORKDIR /var/www/project

RUN npm install -g npm@latest

RUN npm install --global gulp-cli
RUN npm install --global @frctl/fractal
RUN npm install
RUN npm install --save @frctl/fractal
RUN npm install --save @frctl/twig

RUN npm install --save-dev gulp
RUN npm install --save-dev gulp-sass

# ENV PATH /opt/project/fractal/node_modules/.bin:$PATH

# RUN chown -R node:node /opt/project

# Expose 3000 for the node.js server, 3002 for the BrowserSync
EXPOSE 3000 3002


CMD ["fractal", "start", "sync"]

#CMD while true; do sleep 1000; done;




## https://stackoverflow.com/questions/29181032/add-a-volume-to-docker-but-exclude-a-sub-folder


# show config result: docker-compose config