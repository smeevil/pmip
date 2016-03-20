Download the current PMIP Core Bundle - the latest version is always shown under 'Featured Downloads' on the homepage.  Extract the contents of the bundle to **{PROJECT\_HOME\_DIR}/pmip/plugins/** (i.e afterwards you should have '{PROJECT\_HOME\_DIR}/pmip/plugins/core').

Edit pmip.rb so that it includes the bundle
```
plugin 'core'
```

hitting 'Reset' should result in something like:

```
Loading plugin core:
- Version: x.x.x

Ready to go ...
```

The core bundle is currently kept separate from the host plugin because it changes much more frequently than the host. At some point it may become part of the host, once the API's have settled down.

Now we are ready to start CreatingNewPlugins