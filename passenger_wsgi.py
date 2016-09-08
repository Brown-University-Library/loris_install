#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys
from os import path

project_dp = path.dirname(path.dirname(path.realpath(__file__)))

sys.path.append(project_dp)

activate_this = path.join(project_dp, 'env/bin/activate_this.py')
execfile(activate_this, dict(__file__=activate_this))

conf_fp = path.join(project_dp, 'etc', 'loris2.conf')
from loris.webapp import create_app
application = create_app(debug=False, config_file_path=conf_fp)
