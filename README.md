# SW - nim swapi client

This is a simple client to [SWAPI](https://swapi.co/) written in [nim](https://nim-lang.org/).

## TODO

- [x] Use modules
- [ ] Add a --full option for displaying all available fields
- [ ] Caching
- [ ] --field:fieldname option

## Use

The CLI is at the moment really simple.

To get a planet name at random:

`sw planet`

For a character:

`sw people`

## Dev

Use `nim compile -d:ssl --outdir:dist --run src/sw.nim` to compile and run.