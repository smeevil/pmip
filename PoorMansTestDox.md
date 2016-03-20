A quick (and dirty) port of the [TestDox](http://plugins.intellij.net/plugin/?idea&id=96) plugin, with additional support for navigating between ruby src and test files.

```
class ToggleBetweenClassAndTest < PMIPAction
  def run(event, context)
    from = context.editor_filepath
    to = toggle_to(from)
    return if to.nil?
    elements = Elements.new.find_file(to)
    if elements.size == 1
      Navigator.new.open(elements.first)
    else
      if Dialogs.new.yes_no('Test not found', 'Would you like to create a test for this class?')
        to.write_lines([])
        Refresh.file_system { Navigator.new.open(Elements.new.find_file(to).first) }
      end
    end
    result("#{from.name} -> #{to.name}")
  end

  def toggle_to(from)
    case from.extension.downcase
      when 'java'
        from.ends?('Test.java') ? from.replace('Test.java', '.java').replace('/test/', '/src/') :
                from.replace('.java', 'Test.java').replace('/src/', '/test/')
      when 'rb'
        from.name.include?('test_') ? from.replace('/test_', '/').replace('/test/', '/lib/') :
                from.replace("/#{from.name}", "/test_#{from.name}").replace('/lib/', '/test/')
    end
  end
end

bind 'ctrl alt shift T', ToggleBetweenClassAndTest.new
```