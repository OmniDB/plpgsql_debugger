#!/bin/bash

docker run -e REPO="git://github.com/OmniDB/plpgsql_debugger" -e VERSION="3.0.0" -v $PWD:/tmp --rm omnidb/debugger_tarbuild
docker run -e VERSION="3.0.0" -v $PWD:/tmp --rm omnidb/debugger_pkgbuild

sudo chown $USER:$USER *.tar.gz
sudo chown $USER:$USER *.deb
sudo chown $USER:$USER *.rpm
