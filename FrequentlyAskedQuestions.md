## Why does PMIP start with a big red error message? ##

If the message looks something like:

```
PMIP was unable to startup because starting the jruby engine resulted in:
It looks like your intellij settings directory contains a funny character - probably a space. 
JRuby does not like this, please relocate it to a directory that does not contain funny characters

FYI, jruby home was: jar:file:/Users/xxxx/Library/Application Support/IntelliJIdea90CE/PMIP/lib/jruby-complete-1.4.0.jar!/META-INF/jruby.home/bin/jruby: 

The underyling issues was; Illegal character in opaque part at index 40: jar:file:/Users/xxxx/Library/Application Support/IntelliJIdea90CE/PMIP/lib/jruby-complete-1.4.0.jar!/META-INF/jruby.home/bin/jruby
pmip.impl.JRubyInterpreter.guardForDodgyJrubyHome(JRubyInterpreter.java:67)
pmip.impl.JRubyInterpreter.init(JRubyInterpreter.java:48)
pmip.impl.JRubyInterpreter.<init>(JRubyInterpreter.java:17)
pmip.PMIP.resetInterpreter(PMIP.java:78)
pmip.PMIP.projectOpened(PMIP.java:54)
blah ...
blah ...
balh ...
```

**Please upgrade your PMIP plugin to 0.3.0 or higher** - This is a known problem in intellij's classloader that has been fixed in intellij 9.0.3 (see:  [IDEA-55227](http://youtrack.jetbrains.net/issue/IDEA-55227)). At the time of writing that version has not yet been released, so there is a work around in PMIP 0.3.0. It's because the path to your intellij plugins directory contains a space somewhere (in the above example 'Application Support') and the embedded jruby interpreter does not like this.

If for some reason you are unable to upgrade to PMIP 0.3.0 or intellij 9.0.3, then the manual work around is as follows:

Relocate your settings dir to a path that does not contain a space.  The exact change depends on the intellij version and platform.

  * For intellij 9 on Windows this means changing the idea.plugins.path property in your idea.properties file.

  * For intellij 9 on OSX you need to open the package contents, locate Contents/Info.plist and edit the property: Java/Properties/idea.plugins.path

Don't forget to move your existing plugins to the new directory or they will disappear!


---


## How do I install/use rubygems? ##

It's far from ideal, but it is possible to install gems (obviously make sure they are jruby compatible versions!) from the command line.

In order to do this you'll need to locate your intellij settings directory and then run the following:

```
java -jar {INTELLIJ_SETTINGS_DIRECTORY}/config/plugins/PMIP/lib/jruby-complete-x.x.x.jar --command jgem install {GEM_FILE}
```

For example, to install the hpricot gem:
```
java -jar C:/dev/settings/.IntelliJIdea90/config/plugins/PMIP/lib/jruby-complete-x.x.x.jar --command jgem install hpricot-x.x.x-java.gem
```

Once installed you can then require the gem in the normal way, note that you may also need to require 'rubygems' first.

In future, I hope that there might be a more elegant method of installing gems from within PMIP, but I've not found it yet - all suggestions welcome!


---
