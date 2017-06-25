require 'pry'
require 'factory_girl'
require_relative 'support/env'

class UsersApp < Sinatra::Base

  get '/users' do
    "Hello, World!"
  end

  get '/users/test' do
    [200, {'custom-header'=>'value'}, ['Test Values']]
  end

  get '/users/authenticate' do

    if(@authenticateResponseStatus != 200)
      return [@authenticateResponseStatus.to_i, [@authenticateResponseMessage]]
    end

    authHeader = request.env["HTTP_AUTHORIZATION"]
    if(authHeader.nil? || !(authHeader.include? "Bearer"))
      return [403]
    end

    #Return JWT Subject from User if user exists


    #User does not exists
    #Create new company for user
    base_uri = YAML.load(File.read("#{$PROJECT_ROOT}/endpoints/config/test_mock_service.yml"))[ENV['ENVIRONMENT']][:base_uri]
    companyId = SecureRandom.uuid
    companyHref = base_uri + "company/id/" + companyId
    company = FactoryGirl.build(:company, href: companyHref, id: companyId)
    @companies[companyId]=company

    #Create new user
    name = Faker::Pokemon.name + (SecureRandom.random_number(999) + 1000).to_s
    email = name + "@pokemon.com"
    userId = SecureRandom.uuid
    user = FactoryGirl.build(:user, id: userId, token: authHeader.split('Bearer ')[1], userName: name, emailAddress: email, company_href: companyHref, company_name: company.name)
    @users[user.id]=user

    #Create JWT Subject From User


    #Return JWT Subject with 200 status
    binding.pry

    [@authenticateResponseStatus.to_i, {'Content-Type'=>'application/json'}, [@authenticateResponseMessage]]
  end

  post '/users/authenticate/status' do
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

    if(@users == nil)
      @users = Hash.new
    end

    if(@companies == nil)
      @companies = Hash.new
    end

    if(@authenticateResponseStatus == nil)
      @authenticateResponseStatus = 200
    end

    if(@authenticateResponseMessage == nil)
      @authenticateResponseMessage = defaultJwtSubject
    end
  end
end