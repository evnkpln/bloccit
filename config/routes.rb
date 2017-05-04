Rails.application.routes.draw do
  resources :posts

  get 'about' => 'wecome#about'

  root 'welcome#index'
end
