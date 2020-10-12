#!/bin/bash

PGVERSION=13

rm -f *.o *.so
gcc -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -lpq -I /usr/include/postgresql -I /usr/include/postgresql/$PGVERSION/server
gcc -fPIC -o omnidb_plpgsql_debugger.so omnidb_plpgsql_debugger.o -lpq -shared

# debug mode
#rm -f *.o *.so
#gcc -D DEBUG -fPIC -c -o omnidb_plpgsql_debugger.o omnidb_plpgsql_debugger.c -lpq -I /usr/include/postgresql -I /usr/include/postgresql/$PGVERSION/server
#gcc -D DEBUG -fPIC -o omnidb_plpgsql_debugger.so omnidb_plpgsql_debugger.o -lpq -shared
