require 'redmine'
require_dependency 'hooks/join_project_hook'

Redmine::Plugin.register :redmine_spd_join_project do
  name 'Redmine SPD Join Project plugin'
  author 'Maximiliano Dello Russo'
  description 'Este plugin permite que un usuario no miembro de un proyecto pueda autoincluirse en el mismo'
  version '0.0.1'
  url 'https://github.com/maxidr/redmine_spd_join_project'
  author_url 'https://coderwall.com/maxidr'
end
