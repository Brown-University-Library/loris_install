#!/bin/sh

LORIS_DIR="/opt/local/loris"

#copy in our custom configuration
mkdir $LORIS_DIR/etc
cp loris2.conf $LORIS_DIR/etc

pushd $LORIS_DIR

git clone https://github.com/loris-imageserver/loris.git loris_repo

#setup other loris directories
mkdir etc
mkdir bin
mkdir lib
mkdir cache
mkdir log
mkdir source_images
mkdir www
mkdir tmp

cp -r loris_repo/loris .

#setup virtualenv
virtualenv env
source ./env/bin/activate
pip install --upgrade pip
pip install Werkzeug
pip install Pillow
pip install configobj
pip install requests
pip list

popd
