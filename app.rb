require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "active_record"
require_relative "./models/user.rb"

get "/" do 
    "Sinatra Series Homework"
end

get "/api/users/:name" do 
    user = User.find_by(name:params['name'])
   
    content_type :json
    user.user_nopassword
end

get "/api/users" do 
    User.all
end
post "/api/users" do 
    request.body.rewind
    data = JSON.parse request.body.read
    new_user = User.create(name:data['name'],email:data['email'],password:data['password'],bio:data['bio'])
    201
end

post "/api/users/:name/validate" do 
    user = User.find_by(name:params['name'])
    request.body.rewind
    data = JSON.parse request.body.read
    if user.password == data['password']
        user.user_nopassword
    else
       [404,"user not found"]
    end
end

delete "/api/users/:name" do 
    user = User.find_by(name:params['name'])
    if user
        user.destroy
        "user destroyed"
    else
        [404,"user not found"]
    end 
end

put "/api/users/:id" do
end