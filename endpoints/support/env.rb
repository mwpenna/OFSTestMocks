require 'pry'
require 'factory_girl'


$PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../..'))
Dir["#{$PROJECT_ROOT}/endpoints/support/models/*.rb"].each { |file| require file }

environment = ENV['ENVIRONMENT'] ||='local'

FactoryGirl.definition_file_paths = %w(../OFSTestMocks/endpoints/support/factories)
FactoryGirl.find_definitions