require 'pry'

class UsersApp < Sinatra::Base

  get '/users' do
    "Hello, World!"
  end

  get '/users/test' do
    [200, {'custom-header'=>'value'}, ['Test Values']]
  end

  get '/users/authenticate' do
    [@authenticateResponseStatus.to_i, [@authenticateResponseMessage]]
  end

  post '/users/authenticate' do
    [200]
  end

  def defaultJwtSubject
    {
        href: "http://localhost:8080/users/id/123",
        companyhref: "http://localhost:8080/company/id/123",
        firstName: "fname",
        lastName: "lName",
        role: "ADMIN",
        userName: "userName",
        emailAddress: "me@me.com",
    }.to_json
  end

  before do

    if(@authenticateResponseStatus == nil)
      @authenticateResponseStatus = 200
    end

    if(@authenticateResponseMessage == nil)
      @authenticateResponseMessage = defaultJwtSubject
    end
  end
end