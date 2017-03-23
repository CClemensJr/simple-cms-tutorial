Rails.application.routes.draw do

  get 'pages_controller/index'

  get 'pages_controller/show'

  get 'pages_controller/new'

  get 'pages_controller/edit'

  get 'pages_controller/delete'

  root 'demo#index'

  resources :subjects do

    member do
      get :delete
    end
    
  end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'

  # default route may go away in future versions of rails.
  #get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
