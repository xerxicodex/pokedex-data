# pokedata
This project gathers all metagame data from the main Pokémon series in an optimized CSV format.

The main data source comes from the `veekun/pokedex` CSV files, which are generated from
the ripped data of the videogames, but a set of changes are applied on top in order to
optimize and tweak the database depending on the needs of this project.

This project also contains a set of scripts for importing/exporting CSV from/to a database,
through PHP, as well as a set of PHP classes and utilities serving as a database abstracion
layer (DBAL) and Object Relational Mapper (ORM), that can be reused in any PHP project, including
websites based on PHP (Wordpress, etc.).

## Credits
To @eevee and the `veekun/pokedex` project, for being the main data source of this one.

## License

This software is copyrighted and licensed under the 
[MIT license](https://github.com/metaunicorn/pokedata/LICENSE).

### Disclaimer

This software comes bundled with data and graphics extracted from the
Pokémon series of video games. Some terminology from the Pokémon franchise is
also necessarily used within the software itself. This is all the intellectual
property of Nintendo, Creatures, inc., and GAME FREAK, inc. and is protected by
various copyrights and trademarks.

The author believes that the use of this intellectual property for a fan reference
is covered by fair use and that the software is significantly impaired without said
property included. Any use of this copyrighted property is at your own legal risk.

This software is not affiliated in any way with Nintendo,
Pokémon or any other game company.

A complete revision history of this software is available from
https://github.com/metaunicorn/pokedata