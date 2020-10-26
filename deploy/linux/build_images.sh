#!/bin/bash

cd tarbuild
docker build -t omnidb/debugger_tarbuild .
cd ..

cd pkgbuild
docker build -t omnidb/debugger_pkgbuild .
cd ..
