require 'pry'
require 'factory_girl'
require 'faker'
require 'securerandom'


$PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../..'))
Dir["#{$PROJECT_ROOT}/endpoints/support/models/*.rb"].each { |file| require file }

environment = ENV['ENVIRONMENT'] ||='local'

FactoryGirl.definition_file_paths = %w(../OFSTestMocks/endpoints/support/factories)
FactoryGirl.find_definitions

def yaml(file)
  YAML.load(File.read("#{$PROJECT_ROOT}/config/#{file}.yml"))[ENV['ENVIRONMENT']]
end