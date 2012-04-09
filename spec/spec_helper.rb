FILE_DIR = File.dirname(__FILE__)
FIXTURES_DIR = FILE_DIR + "/fixtures"
EXAMPLES_DIR = FILE_DIR + "/../examples"
$:.unshift FILE_DIR
$:.unshift FILE_DIR+"/../lib"

require 'rspec'
require 'primate'

RSpec.configure do |c|
end
