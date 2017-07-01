class UserController < ApplicationController

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users/new' do
    @user = User.create(params[user])
    redirect "/user/#{@user.id}"
  end

  get '/users' do
    erb :'/users/index'
  end


  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end


  #implement edit action for users


end
