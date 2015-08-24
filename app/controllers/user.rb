get '/users/register' do
  erb :'/users/register'
end

post '/users/register' do
  @user = User.new(params[:user])
  if @user.save
    erb :'/users/confirm_registration'
  else
    erb :'/users/failed_registration'
  end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  if User.auth(params[:user][:email], params[:user][:password])
    session[:user] = User.find_by(email: params[:user][:email])
    redirect "/users/#{session[:user][:id]}"
  else
    erb :'users/wrong_info'
  end
end

get '/users/:id' do
 if session[:user]
    @user = User.find_by(id: session[:user][:id])
    erb :'/users/index'
  else
    erb :'users/access_denied'
  end
end

get '/users/:id/logout' do
  @user = User.find_by(id: params[:id])
  erb :'users/logout'
end

post '/users/:id/logout' do
  session.clear
  erb :'users/logged_out'
end
