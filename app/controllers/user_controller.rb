class UserController < ApplicationController

  get '/users' do
    erb :'/users/index'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end

  #implement edit action for users

end
