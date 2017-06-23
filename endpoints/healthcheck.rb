class HealthCheckApp < Sinatra::Base
  get '/' do
    "Tests Mocks is up and running"
  end
end