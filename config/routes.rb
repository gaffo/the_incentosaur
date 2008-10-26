ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "home"
  
  map.namespace :admin do |admin|
  	admin.resources :feed_types, :active_scaffold => true
  	admin.resources :feeds, :active_scaffold => true
  	admin.resources :users, :active_scaffold => true
  	admin.resources :pull, :controller => 'pull'
    admin.namespace :author_feeds  do |af|
      af.resource :recent, :controller => 'recent'
    end
    admin.resources :author_feeds, :active_scaffold => true
  end
  
  map.resource :admin, :controller => 'admin'
  map.resources :feed
  map.resources :user, :id => /.+/

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
