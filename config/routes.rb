# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

post 'projects/:project_id/join', :to => 'join_to_project#create', :as => 'join_to_project'
