#!/bin/bash

# Checking environment
echo "VERSION=$VERSION"


#####################
# Preparing directory
#####################

# Extracting tar.gz
cd $HOME
cp /tmp/omnidb-plpgsql-debugger_$VERSION.tar.gz .
tar -xzvf omnidb-plpgsql-debugger_$VERSION.tar.gz
mv omnidb-plpgsql-debugger_$VERSION tmp
rm -rf omnidb-plpgsql-debugger_$VERSION.tar.gz

# Creating directory structure
mkdir omnidb-plpgsql-debugger_$VERSION
cd omnidb-plpgsql-debugger_$VERSION/
mkdir -p opt/omnidb-plpgsql-debugger
cp $HOME/tmp/* opt/omnidb-plpgsql-debugger/
rm -rf $HOME/tmp/
mkdir DEBIAN
cat > DEBIAN/control << EOF
Package: omnidb-plpgsql-debugger
Version: $VERSION
Section: base
Priority: optional
Architecture: amd64
Installed-Size: $(du -s)
Maintainer: The OmniDB Team
Homepage: http://omnidb.org
Description: OmniDB is a very flexible, secure and work-effective environment for multiple DBMS.
 The OmniDB PL/pgSQL debugger is a PostgreSQL extension that adds debugging capabilities for PL/pgSQL functions and procedures.
 OmniDB is supported by 2ndQuadrant (http://www.2ndquadrant.com)
EOF
cd ..


########################
# Generating deb package
########################

dpkg -b omnidb-plpgsql-debugger_$VERSION


########################
# Generating rpm package
########################

fpm -s deb -t rpm omnidb-plpgsql-debugger_$VERSION.deb


#############################################
# Moving packages to outside of the container
#############################################

mv omnidb*.deb /tmp/
mv omnidb*.rpm /tmp/
