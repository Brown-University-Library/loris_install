#!/bin/sh

LORIS_DIR="/opt/local/loris"

#copy in our custom configuration
mkdir $LORIS_DIR/etc
mkdir $LORIS_DIR/loris
cp loris2.conf $LORIS_DIR/etc
cp launcher.py $LORIS_DIR/loris
cp wsgi.py $LORIS_DIR/loris

pushd $LORIS_DIR

git clone https://github.com/loris-imageserver/loris.git loris_repo

#setup other loris directories
mkdir etc
mkdir bin
mkdir lib
mkdir cache
mkdir log
mkdir source_images
mkdir tmp
mkdir loris/tmp
touch loris/tmp/restart.txt

#copy over files from loris repo
cp loris_repo/loris/* loris/
cp -r loris_repo/www .
cp loris_repo/bin/Linux/x86_64/kdu_expand bin/
cp loris_repo/lib/Linux/x86_64/libkdu_v74R.so lib/

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
