Actions are the simplest method of adding functionality to your plugin (see also: WritingServlets).

To write your action simply extend [PMIPAction](http://code.google.com/p/pmip/source/browse/trunk/pmip/plugins/core/lib/action.rb) and implement the run() method.

A few things to note:
  * PMIPAction extends intellij's AnAction
  * 'event' is an intellij AnActionEvent
  * context is a [PMIPContext](http://code.google.com/p/pmip/source/browse/trunk/pmip/plugins/core/lib/context.rb)

In this example we'll just pop up a Balloon with a nice message:

```
class HelloWorldAction < PMIPAction
  def run(event, context)
    Balloon.new(context).info('Hello from PMIP!')
  end
end
```

Once you've written some actions you'll need to tell intellji about them by BindingActions