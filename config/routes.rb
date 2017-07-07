Rails.application.routes.draw do

  root to: 'static_pages#welcome'

  namespace :admin do
  	
    root to: 'dashboards#home'

    resources :infos do
      collection do
        post :upload
      end
    end

  end

end
