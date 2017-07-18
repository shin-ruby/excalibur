Rails.application.routes.draw do

  root to: 'static_pages#welcome'

  namespace :admin do
  	
    root to: 'dashboards#home'
    resources :users
    resources :infos do
      collection do
        post :upload
      end
    end

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

  end

  # get '*path', controller: 'application', action: 'render_404'

end
