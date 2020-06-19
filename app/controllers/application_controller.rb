
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  post '/articles' do
    Article.create(title: params[:title], content: params[:content])
     redirect to '/articles/' + "#{article[:id]}"
  end

  get '/articles/:id/edit' do
    Article.find(params[:id])
    erb :edit
  end

  patch 'articles/:id' do
    @article = Article.find(params[:id])
    Article.update(title: params[:title], content: params[:content])
    retirect to 'articles/' + "#{article[:id]}"
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to '/articles'
  end

end
