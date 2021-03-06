class GotoHibernateEntity < PMIPAction
  def run(event, context)
    if context.editor?
      name = context.editor_current_word.sub(POJO_BASED, '')
      pattern = /.*entity-name="#{name}".*/
      results = FindInFiles.new(Files.new(context).include('src/java/**/**.hbm.xml')).pattern(pattern, name)

      if results.size == 1
        result = results.first
        result(result.describe)
        result.navigate_to(context)
      else
        result("expected to find one hibernate mappying for: #{name}, but found: #{results}")
      end
    end
  end
end
