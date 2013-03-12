# encoding: UTF-8
require 'redmine'
require_dependency 'hooks/join_project_hook'

Redmine::Plugin.register :redmine_spd_join_project do
  name "Suscripción a projectos (Plataforma SPD)"
  author 'Maximiliano Dello Russo'
  description 'Este plugin permite que un usuario no miembro de un proyecto pueda autoincluirse en el mismo'
  version '0.0.1'
  url 'https://github.com/maxidr/redmine_spd_join_project'
  author_url 'https://coderwall.com/maxidr'

  settings :default => {
    'role_to_subscriptor' => '4',
    'project_manager_roles' => [ Role.first.id, Role.last.id ]
  }, :partial => 'settings/join_project_settings'

end
