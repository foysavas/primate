require 'bundler'
Bundler::GemHelper.install_tasks :name => 'primate'

require 'rspec/core/rake_task'
require 'rake/testtask'

desc "run spec tests"
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = 'spec/**/*_spec.rb'
end
