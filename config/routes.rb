Rails.application.routes.draw do
  get 'advertisements/index'

  get 'advertisements/show'

  get 'advertisements/new'

  get 'advertisements/create'

  get 'advertisement/index'

  get 'advertisement/show'

  get 'advertisement/new'

  get 'advertisement/create'

  resources :posts
  
  resources :advertisements

  get 'about' => 'wecome#about'

  root 'welcome#index'
end
