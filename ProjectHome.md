## Why? ##

Developers rely massively on IDE's and related plugins to increase productivity with particular frameworks and technologies but there are many everyday project inefficiencies that we tend to live with, because writing IDE plugins is a massive [gumption trap](http://en.wikipedia.org/wiki/Gumption_trap). PMIP was created to remedy that by making it simple to write project specific plugins.

For further information see the slides from the ['Introduction to PMIP talk'](http://pmip.googlecode.com/svn/trunk/talk/PMIP/pmip.html) (requires a non IE browser)

<br>
<h2>What is it?</h2>

Poor Man's IDE Plugin (PMIP) is a simple tool for extending your IDE by scripting micro plugins.  PMIP plugins are by design, small, quick and easy to write, shielding the plugin writer from the complexities of the IDE's API.<br>
<br>
Currently PMIP supports ruby scripting of <a href='http://www.jetbrains.com/idea/'>IDEA Intellij</a>

In a nutshell, PMIP provides:<br>
<ul><li>A host plugin that runs inside the IDE which contains an embedded jruby interpreter<br>
</li><li>A bundle of ruby scripts that provide some simple abstractions over Intellij's plugin API</li></ul>

<br>
<h2>A Quick Example</h2>

Bind a simple action to a keypress:<br>
<br>
<pre><code>class HelloWorldAction &lt; PMIPAction<br>
  def run(event, context)<br>
    Dialogs.new(context).info('Hello World', 'Hello from PMIP!')<br>
  end<br>
end<br>
<br>
bind 'ctrl alt shift A', HelloWorldAction.new<br>
</code></pre>

For a more complex example see: PoorMansTestDox a port of the excellent <a href='http://plugins.intellij.net/plugin/?idea&id=96'>TestDox</a> plugin (always the first plugin I install).<br>
<br>
<br>
<h2>Sounds great, how do I start writing my own plugins?</h2>
<ol><li>Follow the tutorial to get a simple plugin running: GettingStarted -> InstallingTheCoreBundle -> CreatingNewPlugins -> WritingActions -> BindingActions<br>
</li><li>Look at the code for some ExamplePlugins<br>
</li><li>Consult the CoreBundleApi<br>
</li><li>Got a problem?  See: FrequentlyAskedQuestions<br>
</li><li>If you like PMIP, please rate it in the <a href='http://plugins.intellij.net/plugin/?idea&id=4571'>Intellij Plugin Repository</a></li></ol>

