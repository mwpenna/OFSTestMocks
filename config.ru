require 'bundler'
Bundler.require

require_relative './endpoints/healthcheck'
require_relative './endpoints/users'
require 'rack'
require 'rack/contrib'

use Rack::PostBodyContentTypeParser
use HealthCheckApp
run UsersApp