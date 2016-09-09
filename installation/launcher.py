#!/usr/bin/env python
#-*- coding: utf-8 -*-

if __name__ == '__main__':
    import sys
    from os import path
    project_dp = path.dirname(path.dirname(path.realpath(__file__)))
    activate_this = path.join(project_dp, 'env/bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))

    from werkzeug.serving import run_simple
    sys.path.append(path.join(project_dp)) # to find any local resolvers

    extra_files = []
    conf_fp = path.join(project_dp, 'etc', 'loris2.conf')
    extra_files.append(conf_fp)

    from webapp import create_app
    app = create_app(debug=False, config_file_path=conf_fp)

    run_simple('localhost', 5004, app, use_debugger=True, use_reloader=True,
        extra_files=extra_files)
