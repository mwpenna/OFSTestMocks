require 'bundler'
Bundler.require

require_relative './endpoints/healthcheck'
require_relative './endpoints/users'
require_relative './endpoints/inventory'
require 'rack'
require 'rack/contrib'

use Rack::PostBodyContentTypeParser
use HealthCheckApp
use InventoryApp
run UsersApp