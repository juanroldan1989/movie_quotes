require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList[
    "test/test_helper.rb",
    "test/movie_quotes/*_test.rb",
    "test/*_test.rb"
  ]
  t.verbose = true
end

desc "Run tests"
task :default => :test

require "bundler"
Bundler::GemHelper.install_tasks
