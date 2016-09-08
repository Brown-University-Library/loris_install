#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys
from os import path
from webapp import create_app
extra_files = []

project_dp = path.dirname(path.dirname(path.realpath(__file__)))
conf_fp = path.join(project_dp, 'etc', 'loris2.conf')
extra_files.append(conf_fp)

sys.path.append(path.join(project_dp)) # to find any local resolvers

application = create_app(debug=False, config_file_path=conf_fp)
