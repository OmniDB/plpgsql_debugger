#!/bin/bash

# Checking environment
echo "REPO=$REPO"
echo "BRANCH=$BRANCH"
echo "VERSION=$VERSION"

# Cloning repo
git clone $REPO --depth 1 -b $BRANCH omnidb-plpgsql-debugger_$VERSION

# Cleaning
cd omnidb-plpgsql-debugger_$VERSION/
rm -f *.o *.so

# Compiling for PostgreSQL 9.3
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I /usr/local/pg93/include -I /usr/local/pg93/include/postgresql -I /usr/local/pg93/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_93.so omnidb_plpgsql_debugger.o -L /usr/local/pg93/lib -lpq -shared

# Compiling for PostgreSQL 9.4
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I /usr/local/pg94/include -I /usr/local/pg94/include/postgresql -I /usr/local/pg94/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_94.so omnidb_plpgsql_debugger.o -L /usr/local/pg94/lib -lpq -shared

# Compiling for PostgreSQL 9.5
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I /usr/local/pg95/include -I /usr/local/pg95/include/postgresql -I /usr/local/pg95/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_95.so omnidb_plpgsql_debugger.o -L /usr/local/pg95/lib -lpq -shared

# Compiling for PostgreSQL 9.6
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I /usr/local/pg96/include -I /usr/local/pg96/include/postgresql -I /usr/local/pg96/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_96.so omnidb_plpgsql_debugger.o -L /usr/local/pg96/lib -lpq -shared

# Compiling for PostgreSQL 10
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I /usr/local/pg10/include -I /usr/local/pg10/include/postgresql -I /usr/local/pg10/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_10.so omnidb_plpgsql_debugger.o -L /usr/local/pg10/lib -lpq -shared

# Compiling for PostgreSQL 11
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I /usr/local/pg11/include -I /usr/local/pg11/include/postgresql -I /usr/local/pg11/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_11.so omnidb_plpgsql_debugger.o -L /usr/local/pg11/lib -lpq -shared

# Compiling for PostgreSQL 12
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I /usr/local/pg12/include -I /usr/local/pg12/include/postgresql -I /usr/local/pg12/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_12.so omnidb_plpgsql_debugger.o -L /usr/local/pg12/lib -lpq -shared

# Compiling for PostgreSQL 13
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I /usr/local/pg13/include -I /usr/local/pg13/include/postgresql -I /usr/local/pg13/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_13.so omnidb_plpgsql_debugger.o -L /usr/local/pg13/lib -lpq -shared

# Cleaning
rm -rf *.o *.sh deploy/ .git/ .gitignore

# Building tarball
cd ..
tar -czvf omnidb-plpgsql-debugger_$VERSION.tar.gz omnidb-plpgsql-debugger_$VERSION/
mv omnidb-plpgsql-debugger_$VERSION.tar.gz /tmp/

