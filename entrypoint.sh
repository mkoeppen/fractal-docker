#!/bin/sh


#if [ -f ./package.json ]; then
#    bower install --allow-root
#fi


# Increase npm install performance

# npm set progress=false

cd /var/www/project

npm cache clean -f

echo "////////////////////////////////////"
echo "// global packages"
echo "////////////////////////////////////"
npm install --global npm@latest
npm install --global gulp-cli
npm install --global @frctl/fractal

echo "////////////////////////////////////"
echo "// npm install"
echo "////////////////////////////////////"

npm install --no-bin-links

echo "////////////////////////////////////"
echo "// fractal"
echo "////////////////////////////////////"
npm install --save @frctl/fractal --no-bin-links

echo "////////////////////////////////////"
echo "// twig"
echo "////////////////////////////////////"
npm install --save @frctl/twig --no-bin-links

echo "////////////////////////////////////"
echo "// gulp install"
echo "////////////////////////////////////"

npm install --save-dev gulp --no-bin-links
npm install --save-dev gulp-sass --no-bin-links

fractal start sync
