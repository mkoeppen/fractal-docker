#!/bin/sh


#if [ -f ./package.json ]; then
#    bower install --allow-root
#fi


# Increase npm install performance

# npm set progress=false


npm install

fractal start sync
