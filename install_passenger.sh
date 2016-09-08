#!/bin/sh

#enable EPEL
yum install -y epel-release yum-utils
yum-config-manager --enable epel

#install passenger
yum install -y epel-release pygpgme
curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo
yum install -y --enablerepo=epel passenger
