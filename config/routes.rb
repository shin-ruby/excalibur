Rails.application.routes.draw do

  root to: 'static_pages#welcome'

  namespace :admin do
    root to: 'dashboards#home'
    resources :infos
  end

end
