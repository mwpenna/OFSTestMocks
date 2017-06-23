require 'factory_girl'

def base_uri
  "http://localhost:8080"
end

FactoryGirl.define do

  factory :jwtsubject, class: JWTSubject do
    href "http://localhost:8080/users/id/123"
    companyhref "http://localhost:8080/company/id/123"
    firstName "fname"
    lastName "lName"
    role "ADMIN"
    userName "userName"
    emailAddress "me@me.com"
  end

end