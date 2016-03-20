Once you've written a PMIPAction you need to bind it so that intellij has some means of executing it.

The 'bind' method (on [Binder](http://code.google.com/p/pmip/source/browse/trunk/pmip/plugins/core/lib/binder.rb)) is used to wire up an instance of a PMIPAction.

```
bind HelloWorldAction.new
```

As a result the action will appear in the 'PMIP' menu and can be invoked by selecting it.

You may optionally bind to a java Keystroke (http://java.sun.com/j2se/1.4.2/docs/api/javax/swing/KeyStroke.html)

```
bind 'ctrl alt shift A', HelloWorldAction.new
```

As a large number of keystrokes in intellij are already taken, it's usually safest to go for 'ctrl alt shift' (something) combinations. This combination has become known as 'banana' (imagine your left hand like a bunch of bananas) and so the 'banana' shortcut is supported by bind

Therefore:

```
bind 'banana A', HelloWorldAction.new
```
and
```
bind 'ctrl alt shift A', HelloWorldAction.new
```

both mean the same.