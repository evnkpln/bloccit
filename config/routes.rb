Rails.application.routes.draw do
  get 'questions/index'

  get 'questions/show'

  get 'questions/new'

  get 'questions/edit'

  resources :posts
  
  resources :questions

  get 'about' => 'wecome#about'

  root 'welcome#index'
end
