source "https://rubygems.org"
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }
plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)

gem "fastlane"
gem "jazzy"
gem "xcov"