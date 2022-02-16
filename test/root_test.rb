ENV['APP_ENV'] = 'test'

require_relative '../app.rb'
require 'minitest/autorun'
require 'rack/test'

include Rack::Test::Methods

def app
    Sinatra::Application
end

describe 'Sinatra Series App' do
    
    it "has title screen" do
      get '/'
      last_response.ok?
      assert_equal last_response.body, 'Sinatra Series Homework- Jasmyne Jean-Remy'
    end

    it "returns user" do
      test_user = User.first
      get '/api/users/'+test_user.name
      last_response.ok?
      assert_equal last_response.body,test_user.user_nopassword
    end

    it "posts to users" do
      post('/api/users',{name:"harry",email:"harry@gmail.com",password:"password",bio:"harry likes to read"}.to_json,{ 'CONTENT_TYPE' => 'application/json' })
      assert_equal User.last.name,"harry"
    end

    
  end