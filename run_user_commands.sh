#!/bin/sh

LORIS_DIR="/opt/local/loris"

pushd $LORIS_DIR
git clone https://github.com/loris-imageserver/loris.git src

#setup virtualenv
virtualenv env
source ./env/bin/activate
pip install --upgrade pip
pip install Werkzeug
pip install Pillow
pip list

popd
