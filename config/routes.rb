Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'wecome#about'

  root 'welcome#index'
end
