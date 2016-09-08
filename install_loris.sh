#!/bin/sh

LORIS_DIR="/opt/local/loris"

yum install -y git python-devel libjpeg-turbo libjpeg-turbo-devel freetype freetype-devel zlib-devel libtiff-devel
 
mkdir -p $LORIS_DIR
useradd -d $LORIS_DIR loris
chown -R loris $LORIS_DIR

su -c "sh run_user_commands.sh" loris
