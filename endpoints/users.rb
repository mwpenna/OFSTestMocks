class UsersApp < Sinatra::Base
  get '/users' do
    "Hello, World!"
  end

  get '/users/test' do
    [400, {'custom-header'=>'value'}, ['Test Value']]
  end
end