Rails.application.routes.draw do
  get 'review/index'
  get 'movie/index'
  root 'movie#index'
  get '/review/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
