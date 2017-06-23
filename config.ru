require 'bundler'
Bundler.require

require_relative './endpoints/healthcheck'
require_relative './endpoints/users'

use HealthCheckApp
run UsersApp