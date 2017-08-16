require 'bundler'
Bundler.require

require_relative './endpoints/healthcheck'
require_relative './endpoints/user_service'
require_relative './endpoints/inventory_service'
require 'rack'
require 'rack/contrib'

use Rack::PostBodyContentTypeParser
use HealthCheckApp
use InventoryServiceApp
run UsersServiceApp