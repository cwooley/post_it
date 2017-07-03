require_relative '../../config/environment.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    use Rack::Session::Cookie, :key => 'rack.session',
                         :path => '/',
                         :secret => 'your_secret'
  end

  get '/' do
    erb :index
  end

  def logged_in?
    # binding.pry
    if session[:id]
      true
    else
      false
    end
  end


end
