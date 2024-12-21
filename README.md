# linux-stevie-build

Build environment for STEVIE on Linux.

## Usage

```bash
# 1. Build docker image for build.
make build-build-image

# 2. Download stevie source archive.
make download-source

# 3. Extract stevie source archive.
make extract-source

# 4. Patch diffs to source to avoid errors.
make patch-source

# 5. Build STEVIE.
make build

# 6. Edit text file with STEVIE.
src/stevie hello.txt
```

Requirements
------------

- Docker
- make
- wget

License
-------

MIT License

Author
------

nil2 <nil2@nil2.org>
