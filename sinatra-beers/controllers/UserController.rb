class UserController < Sinatra::Base

  post '/register' do
    user_details = JSON.parse(request.body.read)
    user = User.new

    user.username = user_details["username"]
    user.password = user_details["password"]
    user.token = rand(1..1000000000000)

    user.save
    user.to_json
  end

  post '/login' do
    user_details = JSON.parse(request.body.read)
    user = User.find_by({username: user_details["username"]})
    if user && user.authenticate(user_details["password"])
      "ACCESS GRANTED"
    else
      "ACCESS DENIED"
    end
  end
end
