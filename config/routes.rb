Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  #DRIVERS
  resources :drivers

  # get 'drivers', to: 'drivers#index', as: 'drivers'
  #
  # get 'drivers/new', to: 'drivers#new', as: 'new_driver'
  # post 'drivers', to: 'drivers#create'
  #
  # get 'drivers/:id', to: 'drivers#show', as: 'driver'
  # get 'drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
  #
  # patch 'drivers/:id', to: 'drivers#update'
  # delete 'drivers/:id', to: 'drivers#destroy'


  #RIDERS
  resources :riders do
    resources :trips do
      member do
        get  'complete_trip'
      end
    end
    # resources :trips, only: [:new, :create] (Dan's comments)
  end
    # resources :trips, except: [:new, :create] (Dan's comments)


end # END of Rails.application.routes.draw
