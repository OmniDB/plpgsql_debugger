# OmniDB PL/pgSQL Debugger

# Introduction

OmniDB offers a full-featured PL/pgSQL debugger. It is offered in 2 different inter-dependent pieces of
software:

- An extension that can be installed in PostgreSQL;
- The debugger GUI inside OmniDB application.

More details on how you can use the PL/pgSQL debugger extension together with the OmniDB GUI can be found
in the documentation:

https://omnidb.readthedocs.io/en/latest/en/13_writing_and_debugging_plpgsql_functions.html


# Installation

## From sources

Starting from OmniDB 3.0, the `omnidb_plpgsql_debugger` is not generally offered in DEB/RPM packages.
Instead, users are encouraged to compile it against the PostgreSQL version and installation of choice.

As root user, download the repository:

```bash
git clone https://github.com/OmniDB/plpgsql_debugger
```

Install headers for PostgreSQL and libpq (package names might be different depending on your distribution):

```bash
sudo apt install postgresql-server-dev-X.Y libpq-dev
```

Compile and install the extension:

```bash
make
sudo make install
```

Add `omnidb_plpgsql_debugger` to `shared_preload_libraries`:

```bash
nano /path/to/postgresql.conf
    shared_preload_libraries = 'omnidb_plpgsql_debugger'

sudo systemctl restart postgresql
```

In the database of choice, create the extension (should be done by a superuser):

```bash
psql -d <database> -c 'CREATE EXTENSION omnidb_plpgsql_debugger'
```

Create sample functions (optional):

```bash
psql -d <database> -f sample_functions.sql
```

Grant privileges to each database user that will debug functions (should be done by a superuser):

```bash
psql -d <database> -c 'GRANT ALL ON SCHEMA omnidb TO <user>; GRANT ALL ON ALL TABLES IN SCHEMA omnidb TO <user>;'
```

Enable passwordless access to each database user that will debug functions. This is needed because the
database will create an additional local connection to perform debugging operations.

We need to add a rule to *pg_hba.conf* of type `host`, matching the PostgreSQL user and database OmniDB is
connected to. The method can be either `trust`, which is insecure and not recommended, or `md5`.

- For `trust`, add rules similar to:

```bash
# TYPE  DATABASE        USER            ADDRESS                 METHOD
host    <database>      <user>          127.0.0.1/32            trust
host    <database>      <user>          ::1/128                 trust
```

- For `md5`, add rules similar to:

```bash
# TYPE  DATABASE        USER            ADDRESS                 METHOD
host    <database>      <user>          127.0.0.1/32            md5
host    <database>      <user>          ::1/128                 md5
```

- Create a `.pgpass` file with a similar content:

```bash
localhost:<port>:<database>:<username>:<password>
```

More information about how `.pgpass` works can be found here:

https://www.postgresql.org/docs/current/libpq-pgpass.html


## Considerations for Debian/Ubuntu and derivatives

On Debian, Ubuntu and derivatives, you can install the `omnidb_plpgsql_debugger` extension pre-compiled
from Debian PGDG repository. First you need to install the PGDG repository (if not installed already):

```bash
sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list
sudo wget --quiet -O - https://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
sudo apt update
```

Then you install the package for your specific PostgreSQL version like this:

```bash
sudo apt install postgresql-X.Y-omnidb
```

Now you can run `CREATE EXTENSION omnidb_plpgsql_debugger` in the database of choice.


## Considerations for Mac OS X 

To compile the debugger on Mac OS X, first you need to install SDK headers for Mac OS:

```bash
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
```

You also need to install PostgreSQL itself, if not installed. An easy way is to install it from Homebrew.
This will also install PostgreSQL headers and libpq.

If brew is not installed yet, you can install it like this:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then:

```bash
brew install postgresql
```

Now you can compile the extension.


## Considerations for Windows

Compiling PostgreSQL itself or PostgreSQL extensions can be challenging. For more information you can
relate to this post:

https://www.2ndquadrant.com/en/blog/compiling-postgresql-extensions-visual-studio-windows/
