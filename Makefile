EXTENSION = omnidb_plpgsql_debugger
DATA = omnidb_plpgsql_debugger--1.0.0.sql
OBJS = omnidb_plpgsql_debugger.o
MODULE_big = omnidb_plpgsql_debugger

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
override CPPFLAGS := $(CPPFLAGS) -I$(shell $(PG_CONFIG) --includedir)
SHLIB_LINK = -lpq
include $(PGXS)
