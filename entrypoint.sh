#!/bin/sh


#if [ -f ./package.json ]; then
#    bower install --allow-root
#fi


# Increase npm install performance

# npm set progress=false


npm install
npm install --save @frctl/fractal
npm install --save @frctl/twig
npm install --save-dev gulp
npm install --save-dev gulp-sass

fractal start sync
