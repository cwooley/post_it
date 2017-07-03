class BlogController < ApplicationController

  get '/blogs/new' do
    erb :'/blogs/new'
  end

  get '/blogs' do
    @blogs = Blog.all.order('vote_count desc')
    erb :'/blogs/index'
  end
  # put this line back in index.erb
  #<p> <a href="/users/<%= blog.user.id %>" style="color: black">Posted by: <%= blog.user.user_name %></a></p>
  get '/blogs/:id' do
    @blog = Blog.find(params[:id])
    erb :'/blogs/show'
  end


  post '/blogs' do
     # User ID of blog params[:user_id].keys[0]
     @blog = Blog.create(params[:blog])
     @user = User.find(params[:user_id].keys[0])
     @user.blogs << @blog
     @blog.user = @user
     #Send back to owner of blogs show page
     redirect :"/users/#{@user.id}"
  end

  post '/blogs/:id/comment' do
    ##Post route here creates comment on blog
    @blog = Blog.find(params[:id])
    @comment = Comment.create(params[:comment])
    @blog.comments << @comment
    @user = User.last
    @user.comments << @comment
    redirect :"/blogs/#{@blog.id}"
  end

  get '/blogs/:id/edit' do
    @blog = Blog.find(params[:id])
    erb :'/blogs/edit'
  end

  patch '/blogs/:id' do
    @blog = Blog.find(params[:id])
    @blog.update!(params[:blog])
    redirect :"/blogs/#{@blog.id}"

  end

  delete '/blogs/:id' do
    @blog = Blog.find(params[:id])
    user_id = @blog.user.id
    @blog.delete
    redirect :"/users/#{user_id}"
  end

  get'/blogs/:id/countup' do
    @blog = Blog.find(params[:id])
    @blog.vote_count += 1
    @blog.save
    redirect :"/blogs/#{@blog.id}"
  end

  get'/blogs/:id/countdown' do
    @blog = Blog.find(params[:id])
    @blog.vote_count -= 1
    @blog.save
    redirect :"/blogs/#{@blog.id}"
  end

end
