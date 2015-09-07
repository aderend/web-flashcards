post '/users/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    flash[:register_error] = "Username Taken or Invalid Password."
    redirect 'users/login'
  end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    flash[:login_error] = "Wrong Username or Password."
    redirect 'users/login'
  end
end

get '/users/:id' do
  if session[:user_id]
    @user = User.find_by(id: session[:user_id])
    erb :'/users/index'
  else
    erb :'users/login'
  end
end

get '/users/:id/logout' do
  session.clear
  redirect '/'
end
