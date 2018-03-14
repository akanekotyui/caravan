Rails.application.routes.draw do
  get 'blogs/create'

  get 'blogs/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/blogs' => 'blogs#index'
  get '/blogs/new' => 'blogs#new'

  #form_forの行き先を定義
  post '/blogs' => 'blogs#create'
  post '/blogs' =>'blogs#index'

  get '/blogs/:id' => 'blogs#show', as: 'blog'
end
