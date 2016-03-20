To create a new plugin, simply add the following line, to your pmip.rb, where 'xyz' is the name of your plugin.

```
plugin 'xyz'
```

Press 'Reset' and PMIP will create the following structure for you:

```
plugins/xyz/
           /lib
           /init.rb
```

Whenever you press 'Reset', PMIP will now execute the code in plugins/xyz/init.rb

Generally plugin code/libaries are stored in 'lib' and init.rb simply loads the code and binds actions to keypress - see the ExamplePlugins for further details.

Note that, you must use 'load' instead of 'require' because like IRB, PMIP will not reload previously required files.

Now you are ready to start WritingActions