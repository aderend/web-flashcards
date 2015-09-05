post '/users/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user] = @user
    redirect "/users/#{session[:user][:id]}"
  else
    redirect 'users/login'
  end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
  if @user
    session[:user] = @user
    redirect "/users/#{session[:user][:id]}"
  else
    flash[:error] = "Wrong Username or Password"
    redirect 'users/login'
  end
end

get '/users/:id' do
  if session[:user]
    @user = User.find_by(id: session[:user][:id])
    erb :'/users/index'
  else
    erb :'users/login'
  end
end

get '/users/:id/logout' do
  session.clear
  redirect '/'
end
