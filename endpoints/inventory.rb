require 'pry'
require 'factory_girl'
require_relative 'support/env'
require 'uri'

class InventoryApp < Sinatra::Base

  inventory = {}
  inventoryResponseStatus = 200
  inventoryResponseMessage = nil
  base_uri = YAML.load(File.read("#{$PROJECT_ROOT}/endpoints/config/test_mock_service.yml"))[ENV['ENVIRONMENT']][:base_uri]

  post '/inventory/status' do
    statusRequest = request.env["rack.request.form_hash"]
    inventoryResponseStatus = statusRequest["status"]
    inventoryResponseMessage = statusRequest["message"]
    [200]
  end

  get '/inventory/clear' do
    users = {}
    companies = {}
    authenticateResponseStatus = 200
    authenticateResponseMessage = nil
  end

  get '/inventory/id/:id' do

  end

  post '/inventory' do
    if(inventoryResponseStatus != 200 || inventoryResponseMessage != nil)
      return [inventoryResponseStatus.to_i, {'Content-Type'=>'application/json'}, [inventoryResponseMessage.to_json]]
    end

    authHeader = request.env["HTTP_AUTHORIZATION"]
    if(authHeader.nil? || !(authHeader.include? "Bearer"))
      return [403]
    end

    inventoryRequest =  request.env["rack.request.form_hash"]
    binding.pry
  end
end