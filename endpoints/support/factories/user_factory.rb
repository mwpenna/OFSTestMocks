require_relative '../env'

FactoryGirl.define do

  factory :user, class: User do
    firstName "fname"
    lastName "lname"
    role "ADMIN"
    company_href "http://localhost:8082/company/id/2fee4545-1997-4e87-9ae0-a6fb40101934"
    company_name "demoCompany"
    userName "fname.lname"
    password "password"
    emailAddress "something@something.com"
    id "123"
    token "token"
  end

end