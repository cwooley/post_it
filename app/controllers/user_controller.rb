class UserController < ApplicationController
  get '/users' do
    erb :'/users/index'
  end

  get '/users/:id' do
    @user = User.find(params[:id])

    karma_per_blog = @user.blogs.map{ |blog| blog.vote_count}
    @karma = karma_per_blog.inject(:+)
    erb :'/users/show'
  end

  #implement edit action for users


  ##Putting authorization routes here for now
  ## Perhaps they should ahve their own controller

  get '/signup' do
    erb :'/registrations/signup'
  end

  post '/resgistrations' do
    @user = User.create(params[:user])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  end

  get '/login' do
    erb :'/sessions/login'
  end

  post '/sessions' do

    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect "/blogs"
    end
  end

  get '/logout' do
    session.clear
    redirect "/blogs"
  end



end
