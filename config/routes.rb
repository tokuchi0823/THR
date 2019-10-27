Rails.application.routes.draw do

  get 'bases/new'

  root 'static_pages#top' 
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/edit-basic-info/:id', to: 'users#edit_basic_info', as: :basic_info
  patch 'update-basic-info', to: 'users#update_basic_info'
  get '/on_duty', to: 'users#on_duty'
  
  resources :bases
  
  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month' 
      patch 'attendances/update_one_month' 
    end
    resources :attendances, only: :update 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
