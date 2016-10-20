Scripts for installing [Loris](https://github.com/loris-imageserver/loris) on EL 7.

### install_loris.sh
- run as root
- configures the Linux system for running Loris, and runs the run_user_commands.sh script (see below)

### run_user_commands.sh
- install_loris.sh runs it as the loris user
- sets up the python virtualenv
- downloads the latest code
- configures loris to run as a wsgi app served out of /opt/local/loris/loris
  - "source env/bin/activate; python loris/launcher.py" (uses Werkzeug run_simple command for a quick test server) OR
  - point [Passenger](https://www.phusionpassenger.com/) (see below) or other app server to passenger_wsgi.py
- to test after a server is running, try "curl http://localhost:3000/01/02/0001.jp2/info.json"

### install_passenger.sh
- run as root
- enables EPEL & Passenger repositories
- installs stand-alone Passenger package
- to start Passenger, cd to /opt/local/loris/loris and run "passenger start"
