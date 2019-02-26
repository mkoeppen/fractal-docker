FROM node:10-alpine


RUN apt-get update && apt-get install -y dos2unix

VOLUME ["/var/www/project"]
WORKDIR /var/www/project

COPY entrypoint.sh entrypoint.sh

RUN dos2unix entrypoint.sh && apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/* 


RUN npm install -g npm@latest

RUN npm install --global gulp-cli
RUN npm install --global @frctl/fractal
#RUN npm install
#RUN npm install --save @frctl/fractal
#RUN npm install --save @frctl/twig

#RUN npm install --save-dev gulp
#RUN npm install --save-dev gulp-sass

# ENV PATH /opt/project/fractal/node_modules/.bin:$PATH

# RUN chown -R node:node /opt/project

# Expose 3000 for the node.js server, 3002 for the BrowserSync
EXPOSE 3000 3002


#CMD ["fractal", "start", "sync"]

#CMD while true; do sleep 1000; done;

ENTRYPOINT ["entrypoint.sh"]


## https://stackoverflow.com/questions/29181032/add-a-volume-to-docker-but-exclude-a-sub-folder


# show config result: docker-compose config