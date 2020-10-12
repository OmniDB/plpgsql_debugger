EXTENSION = omnidb_plpgsql_debugger
DATA = omnidb_plpgsql_debugger--1.0.0.sql
MODULES = omnidb_plpgsql_debugger

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
override CPPFLAGS := $(CPPFLAGS) -I$(shell $(PG_CONFIG) --includedir)
override LDFLAGS := $(LDFLAGS) -lpq
include $(PGXS)
