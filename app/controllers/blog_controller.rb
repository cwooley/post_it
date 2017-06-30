class BlogController < ApplicationController

  get '/blogs' do
    @blogs = Blog.all
    erb :'/blogs/index'
  end

  get '/blogs/:id' do
    @blog = Blog.find(params[:id])
    erb :'/blogs/show'
  end


end
