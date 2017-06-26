require 'pry'
require 'factory_girl'
require_relative 'support/env'

class UsersApp < Sinatra::Base

  users = {}
  companies = {}
  authenticateResponseStatus = 200
  authenticateResponseMessage = nil

  get '/users/authenticate' do

    if(authenticateResponseStatus != 200 || authenticateResponseMessage != nil)
      return [authenticateResponseStatus.to_i, {'Content-Type'=>'application/json'}, [authenticateResponseMessage]]
    end

    authHeader = request.env["HTTP_AUTHORIZATION"]
    if(authHeader.nil? || !(authHeader.include? "Bearer"))
      return [403]
    end

    authToken = authHeader.split('Bearer ')[1]

    users.each do |key,user|
      if(users[key].token == authToken)
        jwtSubject = FactoryGirl.build(:jwtsubject, href: user.href, companyHref: user.company_href, firstName: user.firstName, lastName: user.lastName, role: user.role, userName: user.userName, emailAddress: user.emailAddress)
        return [200, {'Content-Type'=>'application/json'}, jwtSubject.to_json]
      end
    end

    base_uri = YAML.load(File.read("#{$PROJECT_ROOT}/endpoints/config/test_mock_service.yml"))[ENV['ENVIRONMENT']][:base_uri]
    companyId = SecureRandom.uuid
    companyHref = base_uri + "company/id/" + companyId
    company = FactoryGirl.build(:company, href: companyHref, id: companyId)
    companies[companyId]=company

    name = Faker::Pokemon.name + (SecureRandom.random_number(999) + 1000).to_s
    email = name + "@pokemon.com"
    userId = SecureRandom.uuid
    user = FactoryGirl.build(:user, href:base_uri + "users/id/" + userId, id: userId, token: authToken, userName: name, emailAddress: email, company_href: companyHref, company_name: company.name)
    users[user.id]=user

    jwtSubject = FactoryGirl.build(:jwtsubject, href: user.href, companyHref: company.href, firstName: user.firstName, lastName: user.lastName, role: user.role, userName: user.userName, emailAddress: user.emailAddress)

    [200, {'Content-Type'=>'application/json'}, jwtSubject.to_json]
  end

  post '/users/authenticate/status' do
    statusRequest = request.env["rack.request.form_hash"]
    authenticateResponseStatus = statusRequest["status"]
    authenticateResponseMessage = statusRequest["message"]
    [200]
  end
end