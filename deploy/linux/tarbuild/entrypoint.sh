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
PREFIX="/usr/local/pg93"
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I $PREFIX/include -I $PREFIX/include/postgresql -I $PREFIX/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_93.so omnidb_plpgsql_debugger.o -L $PREFIX/lib -lpq -shared

# Compiling for PostgreSQL 9.4
PREFIX="/usr/local/pg94"
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I $PREFIX/include -I $PREFIX/include/postgresql -I $PREFIX/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_94.so omnidb_plpgsql_debugger.o -L $PREFIX/lib -lpq -shared

# Compiling for PostgreSQL 9.5
PREFIX="/usr/local/pg95"
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I $PREFIX/include -I $PREFIX/include/postgresql -I $PREFIX/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_95.so omnidb_plpgsql_debugger.o -L $PREFIX/lib -lpq -shared

# Compiling for PostgreSQL 9.6
PREFIX="/usr/local/pg96"
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I $PREFIX/include -I $PREFIX/include/postgresql -I $PREFIX/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_96.so omnidb_plpgsql_debugger.o -L $PREFIX/lib -lpq -shared

# Compiling for PostgreSQL 10
PREFIX="/usr/local/pg10"
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I $PREFIX/include -I $PREFIX/include/postgresql -I $PREFIX/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_10.so omnidb_plpgsql_debugger.o -L $PREFIX/lib -lpq -shared

# Compiling for PostgreSQL 11
PREFIX="/usr/local/pg11"
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I $PREFIX/include -I $PREFIX/include/postgresql -I $PREFIX/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_11.so omnidb_plpgsql_debugger.o -L $PREFIX/lib -lpq -shared

# Compiling for PostgreSQL 12
PREFIX="/usr/local/pg12"
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I $PREFIX/include -I $PREFIX/include/postgresql -I $PREFIX/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_12.so omnidb_plpgsql_debugger.o -L $PREFIX/lib -lpq -shared

# Compiling for PostgreSQL 13
PREFIX="/usr/local/pg13"
rm -f *.o
$CC -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -I $PREFIX/include -I $PREFIX/include/postgresql -I $PREFIX/include/postgresql/server
$CC -fPIC -o omnidb_plpgsql_debugger_93.so omnidb_plpgsql_debugger.o -L $PREFIX/lib -lpq -shared

# Cleaning
rm -f *.o

# Building tarball
cd ..
tar -czvf omnidb-plpgsql-debugger_$VERSION.tar.gz omnidb-plpgsql-debugger_$VERSION/
mv omnidb-plpgsql-debugger_$VERSION.tar.gz /tmp/

