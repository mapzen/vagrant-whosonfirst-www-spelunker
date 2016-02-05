# whosonfirst-www-spelunker-vagrant

Everything - all the data, all the indexing, all the search - you need to run
the Who's On First spelunker locally.

## This almost works

This almost works. If you're feeling dangerous and can live with a little bit of mystery and or debugging then what follows _should_ work for you.

First start with:

```
make build
```

This is just a helper target to setup the default `Vagrant` file, spin the box up, clone [whosonfirst-www-spelunker](https://github.com/whosonfirst/whosonfirst-www-spelunker) package and then log in to the new virtual machine.

Once that's done you'll need to type some more things. This isn't ideal but the reality is that in order to complete the setup process you still need to type some things by hand. These include agreeing to the Java Oracle license and entering a master password for creating a self-contained certificate authority (CA). The Java thing might go away and the CA thing is possibly overkill for a self-hosted application running on your laptop. But that's the way it is _today_ so you'll need to do the following after you've logged in:

```
cd /usr/local/mapzen/whosonfirst-www-spelunker
make setup
```

This will trigger a whole bunch of scripts that will finish downloading and installing all the things you need to run the spelunker.

Once that's done and if you don't already have a copy of the Who's On First data that you've mounted as a "synced folder" in your `Vagrantfile` you will want to get some data to work with. You can do this manually or you can type:

```
make data
```

This will download and install the latest Who's On First (WOF) data for [common placetypes](https://github.com/whosonfirst/whosonfirst-placetypes#common-c) in `/usr/local/mapzen/whosonfirst-www-spelunker/data`. Support for automatically fetching and installing other placetypes will happen eventually but not today.

Once all the WOF data has been downloaded you will need to index it which you can by typing:

```
make index
```

This might take a while depending on how many computrons your computer has for the job. Once it's complete though you should be able to point your web browser at `https://localhost:8984/` and see a working version of the spelunker!
 
Note that the default build scripts will create a self-signed TLS certificate so you should expect your browser to display a security warning.

## Alternate data sources

If you want to load WOF data from a source other than `/usr/local/mapzen/whosonfirst-www-spelunker/data` have a look at the [data sources](https://github.com/whosonfirst/whosonfirst-www-spelunker#data-sources) section of `whosonfirst-www-spelunker` documentation for details on how to do that. Don't worry, it's not complicated.

## See also

* https://github.com/whosonfirst/whosonfirst-www-spelunker
