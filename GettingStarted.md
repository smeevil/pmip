Install the host plugin, by downloading it from the plugin manager in intellij [(or using the direct download link)](http://plugins.intellij.net/plugin/?idea&id=4571). Once intellij has restarted you should see a new '**PMIP**' tab (at the bottom of the screen) and if all has gone well a message along the lines of:

```
Hello PMIP x.x.x! - Please see http://code.google.com/p/pmip/ for full instructions and plugin helper bundles.
```

On opening a project PMIP will look for the file: **{PROJECT\_HOME\_DIR}/pmip/pmip.rb** and execute it. PMIP will also evaluate the contents of that script whenever you press the '**Reset**' button on the PMIP tab. It's effectively like an IRB session.  So replacing the contents of pmip.rb with:

```
puts "hello"
a = 10
puts a*3
```

and hitting 'Reset' yields the following in the PMIP console:

```
hello
30

Ready to go ...
```

That's useful itself, but it's more interesting when we start to interact with intellii.  In order to do this firstly you'll need to see InstallingTheCoreBundle.