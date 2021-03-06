load 'lib/navigate_to_test.rb'
load 'lib/mangle_test_results.rb'
load 'lib/junit_result_file_handler.rb'

class ViewTestResults
  def self.start(port, junit_result_path, test_src_pattern, context = PMIPContext.new)

    mount '/NavigateToTest', NavigateToTest, {:TestSrcPattern => test_src_pattern}
    mount '/alltests-errors.html', MangleTestResults, {:Path => junit_result_path, :Port => port, :File => 'alltests-errors.html'}
    mount '/alltests-fails.html', MangleTestResults, {:Path => junit_result_path, :Port => port, :File => 'alltests-fails.html'}
    mount '/all-tests.html', MangleTestResults, {:Path => junit_result_path, :Port => port, :File => 'all-tests.html'}
    mount '/', JUnitResultFileHandler, junit_result_path
    mount '/assets', NonCachingFileHandler, context.plugin_root + '/assets'

    server port
  end
end