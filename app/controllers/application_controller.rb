
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  # end

  get '/posts' do
      @posts = Post.all

      erb :'posts/index'
    end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    # params {'name'=>'name of post', 'content'=>'content for post'}
    @post = Post.new
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    redirect '/posts'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :'posts/edit'
  end

  patch '/posts/:id' do
      @post = Post.find(params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
      @post.save

      redirect '/posts/#{@post.id}'
  end

end
