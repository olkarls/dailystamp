Dailystamp::Application.routes.draw do
  resources :favorites

  match '/signup', :controller => 'users', :action => 'new', :as => :signup
  match '/logout', :controller => 'user_sessions', :action => 'destroy', :as => :logout
  match '/login', :controller => 'user_sessions', :action => 'new', :as => :login
  match '/home', :controller => 'stamps', :action => 'index', :no_redirect => "true", :as => :home
  
  resources :user_sessions
  resources :users
  resources :stamp_images
  resources :marks
  resources :stamps do
    member do
      get :edit_goal
    end
  end
  
  root :to => 'stamps#index'
end
