ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "home"
  
  map.namespace :admin do |admin|
  	admin.resources :feed_types, :active_scaffold => true
  	admin.resources :feeds, :active_scaffold => true
  	admin.resources :users, :active_scaffold => true
  	admin.resources :pull, :controller => 'pull'
  end
  
  map.resources :feed
  map.resources :user, :id => /.+/

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
