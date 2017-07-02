class UserController < ApplicationController

  get '/users' do
    erb :'/users/index'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end

  #implement edit action for users


  ##Putting authorization routes here for now
  ## Perhaps they should ahve their own controller

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/resgistrations' do
    @user = User.create(params[:user])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  end

end
