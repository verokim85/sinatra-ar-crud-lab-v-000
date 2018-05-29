
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/posts' do
      @posts = Post.all

      erb :"posts/index"
    end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'posts/show'
  end 
end
