ActionController::Routing::Routes.draw do |map|
  map.register '/register/:activation_code', :controller => 'activations', :action => 'new'
  map.activate '/activate/:id', :controller => 'activations', :action => 'create'
#  map.resources :users
  map.resource :account, :controller => "users"
  map.resources :password_resets
  map.resource :user_session
  # Home Page
  map.root :controller => "user_sessions", :action => "new"
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  # Catch all url
  map.connect '*path', :controller => "user_sessions", :action => "new"
end
