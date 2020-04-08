Rails.application.routes.draw do
  
  post '/callback' => 'linebot#callback' 
  get '/map_request', to: 'plans#map', as: 'map_request'
  
  resources :sankas, only: [:create, :destroy]
  
  get 'basic_pages/basic'

  get 'bases/new'

  root 'static_pages#top' 
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/edit-basic-info/:id', to: 'users#edit_basic_info', as: :basic_info
  patch 'update-basic-info', to: 'users#update_basic_info'
  get '/on_duty', to: 'users#on_duty'
  
  #post '/users', to: 'users#insert'
  
  patch 'attendances/update_approval_one_month', to: 'attendances#update_approval_one_month'
  
  resources :plans
  
  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month' 
      patch 'attendances/update_one_month' 
      get 'attendances/edit_zangyo_info'
      patch 'attendances/update_zangyo_info'
      get 'attendances/approval_zangyo_info'
      patch 'attendances/update_approval_zangyo_info'
      
      get 'attendances/approval_change_info'
      patch 'attendances/update_approval_change_info'
      
      get 'attendances/change_log' 
      get 'attendances/csv_output'
      
      get 'attendances/approval_one_month_info'
      patch 'attendances/update_approval_one_month_info'
    end
    resources :attendances, only: :update 
  end
  post '/users', to: 'users#insert'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
